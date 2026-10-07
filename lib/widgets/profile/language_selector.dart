import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  final String currentLanguage;
  final ValueChanged<String> onChanged;

  const LanguageSelector({
    super.key,
    required this.currentLanguage,
    required this.onChanged,
  });

  void _showLanguageDialog(BuildContext context) {
    final languages = [
      'Bahasa Spanyol',
      'Bahasa Inggris',
      'Bahasa Jepang',
      'Bahasa Korea',
    ];

    showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pilih Bahasa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: languages.map((language) {
              return RadioListTile<String>(
                title: Text(language),
                value: language,
                groupValue: currentLanguage,
                onChanged: (value) {
                  Navigator.pop(context, value);
                },
              );
            }).toList(),
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        onChanged(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFFFE0B2),
          child: Icon(
            Icons.language,
            color: Colors.orange,
          ),
        ),
        title: const Text(
          'Bahasa Dipelajari',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(currentLanguage),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          _showLanguageDialog(context);
        },
      ),
    );
  }
}