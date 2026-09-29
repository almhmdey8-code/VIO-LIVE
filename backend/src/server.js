require('dotenv').config();

const express = require('express');
const cors = require('cors');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { Pool } = require('pg');

const app = express();

app.use(cors());
app.use(express.json());

const port = Number(process.env.PORT || 8080);
const jwtSecret = process.env.JWT_SECRET || 'dev-only-change-this-secret';

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

function createToken(user) {
  return jwt.sign(
    {
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      role: user.role,
    },
    jwtSecret,
    { expiresIn: '30d' },
  );
}

app.get('/health', async (_req, res) => {
  try {
    await pool.query('SELECT 1');
    res.json({
      status: 'ok',
      service: 'VIO LIVE',
    });
  } catch (error) {
    console.error('HEALTH_ERROR:', error);
    res.status(500).json({
      status: 'error',
      error: 'DATABASE_UNAVAILABLE',
    });
  }
});

app.post('/api/auth/register', async (req, res) => {
  const {
    name,
    username,
    email,
    phone,
    password,
  } = req.body || {};

  if (!name || !username || !password || (!email && !phone)) {
    return res.status(400).json({
      error: 'INVALID_INPUT',
    });
  }

  try {
    const normalizedEmail = email
      ? String(email).trim().toLowerCase()
      : null;

    const normalizedPhone = phone
      ? String(phone).trim()
      : null;

    const existing = await pool.query(
      `SELECT id
       FROM users
       WHERE ($1::text IS NOT NULL AND LOWER(email) = $1)
          OR ($2::text IS NOT NULL AND phone = $2)
          OR username = $3
       LIMIT 1`,
      [normalizedEmail, normalizedPhone, String(username).trim()],
    );

    if (existing.rows.length) {
      return res.status(409).json({
        error: 'ACCOUNT_ALREADY_EXISTS',
      });
    }

    const passwordHash = await bcrypt.hash(String(password), 12);

    const result = await pool.query(
      `INSERT INTO users
       (name, username, email, phone, password_hash)
       VALUES ($1, $2, $3, $4, $5)
       RETURNING id, name, username, email, phone, role,
                 email_verified, phone_verified, verified`,
      [
        String(name).trim(),
        String(username).trim(),
        normalizedEmail,
        normalizedPhone,
        passwordHash,
      ],
    );

    res.status(201).json({
      user: result.rows[0],
      message: 'ACCOUNT_CREATED',
    });
  } catch (error) {
    console.error('REGISTER_ERROR:', error);
    res.status(500).json({
      error: 'SERVER_ERROR',
    });
  }
});

app.post('/api/auth/login', async (req, res) => {
  const { email, password } = req.body || {};

  if (!email || !password) {
    return res.status(400).json({
      error: 'INVALID_INPUT',
    });
  }

  try {
    const result = await pool.query(
      `SELECT id, name, username, email, phone,
              password_hash, role, email_verified,
              phone_verified, verified, verified_label,
              banned, banned_reason
       FROM users
       WHERE LOWER(email) = LOWER($1)
       LIMIT 1`,
      [String(email).trim()],
    );

    const user = result.rows[0];

    if (!user || !(await bcrypt.compare(String(password), user.password_hash))) {
      return res.status(401).json({
        error: 'INVALID_CREDENTIALS',
      });
    }

    if (user.banned) {
      return res.status(403).json({
        error: 'ACCOUNT_BANNED',
        reason: user.banned_reason || 'ACCOUNT_BANNED',
      });
    }

    if (!user.email_verified && !user.phone_verified) {
      return res.status(403).json({
        error: 'ACCOUNT_NOT_VERIFIED',
      });
    }

    const publicUser = {
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      phone: user.phone,
      role: user.role,
      verified: user.verified,
      verified_label: user.verified_label,
    };

    res.json({
      user: publicUser,
      token: createToken(publicUser),
    });
  } catch (error) {
    console.error('LOGIN_ERROR:', error);
    res.status(500).json({
      error: 'SERVER_ERROR',
    });
  }
});

app.use((_req, res) => {
  res.status(404).json({
    error: 'NOT_FOUND',
  });
});

app.listen(port, () => {
  console.log(`VIO LIVE backend listening on :${port}`);
});
