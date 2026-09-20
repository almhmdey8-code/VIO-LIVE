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
        scaffoldBackgroundColor: const Color(0xFF0B0B0B),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD4AF37),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const VioHomePage(),
    );
  }
}

class VioHomePage extends StatelessWidget {
  const VioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'VIO LIVE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4AF37),
          ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VIO LIVE',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4AF37),
          ),
        ),
      ),
    );
  }
}
