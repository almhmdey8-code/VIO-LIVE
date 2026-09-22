import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const VioLiveApp());
}

class VioLiveApp extends StatelessWidget {
  const VioLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VIO LIVE',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050505),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const VioSplashScreen(),
    );
  }
}

class VioSplashScreen extends StatefulWidget {
  const VioSplashScreen({super.key});

  @override
  State<VioSplashScreen> createState() => _VioSplashScreenState();
}

class _VioSplashScreenState extends State<VioSplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const VioLoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF181818),
              Color(0xFF050505),
              Color(0xFF000000),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFD4AF37),
                    width: 3,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x66D4AF37),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 82,
                    color: Color(0xFFD4AF37),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'VIO LIVE',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 3,
                  color: Color(0xFFD4AF37),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'LIVE • CONNECT • SHARE',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 2,
                  color: Colors.white.withOpacity(0.65),
                ),
              ),
              const SizedBox(height: 45),
              const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xFFD4AF37),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VioLoginScreen extends StatefulWidget {
  const VioLoginScreen({super.key});

  @override
  State<VioLoginScreen> createState() => _VioLoginScreenState();
}

class _VioLoginScreenState extends State<VioLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  InputDecoration fieldDecoration({
    required String hint,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Colors.white54,
      ),
      prefixIcon: Icon(
        icon,
        color: const Color(0xFFD4AF37),
      ),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFF101010),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xFFD4AF37),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xFFFFD966),
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 18,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFD4AF37),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.language,
                        size: 18,
                        color: Color(0xFFD4AF37),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'English',
                        style: TextStyle(
                          color: Color(0xFFD4AF37),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFFD4AF37),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFD4AF37),
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x55D4AF37),
                      blurRadius: 25,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 60,
                  color: Color(0xFFD4AF37),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'VIO LIVE',
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                  color: Color(0xFFD4AF37),
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'LIVE • CONNECT • SHARE',
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                'Welcome to VIO LIVE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD966),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Log in to continue your journey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 28),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                decoration: fieldDecoration(
                  hint: 'Email or Phone Number',
                  icon: Icons.email_outlined,
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                style: const TextStyle(color: Colors.white),
                decoration: fieldDecoration(
                  hint: 'Password',
                  icon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'LOG IN',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const VioPhoneLoginScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.phone_android_rounded,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Phone Number',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 52),
                        side: const BorderSide(
                          color: Color(0xFFD4AF37),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const VioSnapchatLoginScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Snapchat',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 52),
                        side: const BorderSide(
                          color: Color(0xFFD4AF37),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: OutlinedButton.icon(
                  onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (_) => const VioCreateAccountScreen())); },
                  icon: const Icon(
                    Icons.person_add_alt_1,
                    color: Color(0xFFD4AF37),
                  ),
                  label: const Text(
                    'CREATE NEW ACCOUNT',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFFD4AF37),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'By continuing, you agree to our',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Terms of Service  •  Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}


class VioCreateAccountScreen extends StatefulWidget {
  const VioCreateAccountScreen({super.key});

  @override
  State<VioCreateAccountScreen> createState() => _VioCreateAccountScreenState();
}

class _VioCreateAccountScreenState extends State<VioCreateAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool agreeToTerms = false;
  bool isCreatingAccount = false;

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    contactController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  InputDecoration fieldDecoration({
    required String hint,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54),
      prefixIcon: Icon(icon, color: const Color(0xFFD4AF37)),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color(0xFF101010),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xFFD4AF37),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xFFFFD966),
          width: 2,
        ),
      ),
    );
  }

  Future<void> createAccount() async {
    if (isCreatingAccount) return;

    if (!agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please agree to the Terms of Service and Privacy Policy.',
          ),
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match.'),
        ),
      );
      return;
    }

    setState(() {
      isCreatingAccount = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isCreatingAccount = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Account creation will be connected to the VIO LIVE server later.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0xFFD4AF37),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'CREATE ACCOUNT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),

              const SizedBox(height: 12),

              Center(
                child: Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFD4AF37),
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x55D4AF37),
                        blurRadius: 22,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 52,
                    color: Color(0xFFD4AF37),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Join VIO LIVE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Create your account and start your journey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 28),

              TextField(
                controller: nameController,
                textInputAction: TextInputAction.next,
                decoration: fieldDecoration(
                  hint: 'Full Name',
                  icon: Icons.person_outline_rounded,
                ),
              ),

              const SizedBox(height: 14),

              TextField(
                controller: usernameController,
                textInputAction: TextInputAction.next,
                decoration: fieldDecoration(
                  hint: 'Username',
                  icon: Icons.alternate_email_rounded,
                ),
              ),

              const SizedBox(height: 14),

              TextField(
                controller: contactController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: fieldDecoration(
                  hint: 'Email or Phone Number',
                  icon: Icons.mail_outline_rounded,
                ),
              ),

              const SizedBox(height: 14),

              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                textInputAction: TextInputAction.next,
                decoration: fieldDecoration(
                  hint: 'Password',
                  icon: Icons.lock_outline_rounded,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFFD4AF37),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              TextField(
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                textInputAction: TextInputAction.done,
                decoration: fieldDecoration(
                  hint: 'Confirm Password',
                  icon: Icons.lock_reset_outlined,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFFD4AF37),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Password recovery will be connected later.',
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              CheckboxListTile(
                value: agreeToTerms,
                onChanged: (value) {
                  setState(() {
                    agreeToTerms = value ?? false;
                  });
                },
                contentPadding: EdgeInsets.zero,
                activeColor: const Color(0xFFD4AF37),
                checkColor: Colors.black,
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text(
                  'I agree to the Terms of Service and Privacy Policy.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: isCreatingAccount ? null : createAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.black,
                    disabledBackgroundColor: const Color(0xFF6F5B1C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: isCreatingAccount
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'جاري إنشاء الحساب...',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        )
                      : const Text(
                          'CREATE ACCOUNT',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 13,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Color(0xFFD4AF37),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              const Text(
                'Terms of Service  •  Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class VioPhoneLoginScreen extends StatefulWidget {
  const VioPhoneLoginScreen({super.key});

  @override
  State<VioPhoneLoginScreen> createState() => _VioPhoneLoginScreenState();
}

class _VioPhoneLoginScreenState extends State<VioPhoneLoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoggingIn = false;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (isLoggingIn) return;

    setState(() {
      isLoggingIn = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isLoggingIn = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Phone login will be connected to the VIO LIVE server later.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xFFD4AF37),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Center(
                child: Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFD4AF37),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.phone_android_rounded,
                    size: 52,
                    color: Color(0xFFD4AF37),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Login with Phone Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFD4AF37),
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Enter your phone number and password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(
                    Icons.phone_outlined,
                    color: Color(0xFFD4AF37),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF101010),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Color(0xFFD4AF37),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Color(0xFFFFD966),
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.white54),
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: Color(0xFFD4AF37),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFFD4AF37),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF101010),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Color(0xFFD4AF37),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Color(0xFFFFD966),
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: isLoggingIn ? null : login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    foregroundColor: Colors.black,
                    disabledBackgroundColor: const Color(0xFF6F5B1C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: isLoggingIn
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              'جاري تسجيل الدخول...',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        )
                      : const Text(
                          'LOG IN',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 22),

              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'BACK TO LOGIN',
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VioSnapchatLoginScreen extends StatelessWidget {
  const VioSnapchatLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.camera_alt_rounded,
                  size: 90,
                  color: Color(0xFFFFD700),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Snapchat Login',
                  style: TextStyle(
                    color: Color(0xFFD4AF37),
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Continue with Snapchat',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'CONTINUE WITH SNAPCHAT',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text(
                    'BACK TO LOGIN',
                    style: TextStyle(
                      color: Color(0xFFD4AF37),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
