import 'package:flutter/material.dart';
import '../models/user_data.dart';

class CourseCard extends StatelessWidget {
  CourseCard({super.key});

  final List<Map<String, String>> _languageData = [
    {'name': 'Bahasa Spanyol', 'flagUrl': 'https://flagcdn.com/w160/es.png'},
    {'name': 'Bahasa Jepang', 'flagUrl': 'https://flagcdn.com/w160/jp.png'},
    {'name': 'Bahasa Korea', 'flagUrl': 'https://flagcdn.com/w160/kr.png'},
    {'name': 'Bahasa Inggris', 'flagUrl': 'https://flagcdn.com/w160/gb.png'},
    {'name': 'Bahasa Mandarin', 'flagUrl': 'https://flagcdn.com/w160/cn.png'},
  ];

  void _showLanguageSelector(BuildContext context, String currentLang) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Pilih Bahasa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...List.generate(_languageData.length, (index) {
                final language = _languageData[index]['name']!;
                final flagUrl = _languageData[index]['flagUrl']!;
                
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(flagUrl),
                    radius: 16,
                  ),
                  title: Text(language, style: const TextStyle(fontSize: 16)),
                  trailing: currentLang == language
                      ? Icon(Icons.check_circle_rounded, color: Colors.orange.shade600)
                      : null,
                  onTap: () {
                    dummyUser.currentLanguage.value = language;
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }

  String _getFlagUrl(String language) {
    final active = _languageData.firstWhere(
      (lang) => lang['name'] == language,
      orElse: () => _languageData[0],
    );
    return active['flagUrl']!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ValueListenableBuilder<String>(
        valueListenable: dummyUser.currentLanguage,
        builder: (context, selectedLanguage, child) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => _showLanguageSelector(context, selectedLanguage),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(_getFlagUrl(selectedLanguage)),
                        radius: 28,
                        backgroundColor: Colors.grey.shade100,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sedang Dipelajari',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              selectedLanguage,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey.shade400),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}