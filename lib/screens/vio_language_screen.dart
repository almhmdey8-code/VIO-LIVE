import 'package:flutter/material.dart';
import '../services/vio_language_service.dart';

class VioLanguageScreen extends StatefulWidget {
  const VioLanguageScreen({super.key});

  @override
  State<VioLanguageScreen> createState() => _VioLanguageScreenState();
}

class _VioLanguageScreenState extends State<VioLanguageScreen> {
  Locale اللغة_المحددة = VioLanguageService.اللغة_الحالية;

  final List<Map<String, String>> اللغات = const [
    {'code': 'ar', 'name': 'العربية'},
    {'code': 'en', 'name': 'English'},
    {'code': 'fr', 'name': 'Français'},
    {'code': 'tr', 'name': 'Türkçe'},
    {'code': 'fa', 'name': 'فارسی'},
    {'code': 'ru', 'name': 'Русский'},
    {'code': 'zh', 'name': '中文'},
    {'code': 'ko', 'name': '한국어'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0B0B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0B0B),
        iconTheme: const IconThemeData(
          color: Color(0xFFD4AF37),
        ),
        title: const Text(
          'Language',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: اللغات.length,
        itemBuilder: (context, index) {
          final اللغة = اللغات[index];
          final selected =
              اللغة_المحددة.languageCode == اللغة['code'];

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF151515),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected
                    ? const Color(0xFFD4AF37)
                    : const Color(0xFF292929),
              ),
            ),
            child: ListTile(
              title: Text(
                اللغة['name']!,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Icon(
                selected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: selected
                    ? const Color(0xFFD4AF37)
                    : Colors.white54,
              ),
              onTap: () {
                final locale = Locale(اللغة['code']!);

                VioLanguageService.تغيير_اللغة(locale);

                setState(() {
                  اللغة_المحددة = locale;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
