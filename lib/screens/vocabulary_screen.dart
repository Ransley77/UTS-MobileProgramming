import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../data/vocabulary_data.dart';
import '../widgets/vocabulary/category_chip.dart';
import '../widgets/vocabulary/vocabulary_card.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  final FlutterTts flutterTts = FlutterTts();
  String selectedLanguage = 'Bahasa Spanyol';
  final Set<String> favoriteWords = {};
  String searchQuery = '';
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _setTtsLanguage(selectedLanguage);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _setTtsLanguage(String language) async {
    String languageCode = 'en-US';
    switch (language) {
      case 'Bahasa Spanyol':
        languageCode = 'es-ES';
        break;
      case 'Bahasa Jepang':
        languageCode = 'ja-JP';
        break;
      case 'Bahasa Korea':
        languageCode = 'ko-KR';
        break;
      case 'Bahasa Mandarin':
        languageCode = 'zh-CN';
        break;
    }
    await flutterTts.setLanguage(languageCode);
  }

  void _speak(String text) async {
    await flutterTts.speak(text);
  }

  void _toggleFavorite(String word) {
    setState(() {
      if (favoriteWords.contains(word)) {
        favoriteWords.remove(word);
      } else {
        favoriteWords.add(word);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> currentList = [];

    if (selectedLanguage == 'Favorit') {
      vocabData.forEach((key, list) {
        currentList.addAll(
          list.where((item) => favoriteWords.contains(item['word'])),
        );
      });
    } else {
      currentList = List.from(vocabData[selectedLanguage]!);
    }

    if (searchQuery.isNotEmpty) {
      currentList = currentList.where((item) {
        final wordLower = item['word']!.toLowerCase();
        final transLower = item['translation']!.toLowerCase();
        final queryLower = searchQuery.toLowerCase();
        return wordLower.contains(queryLower) ||
            transLower.contains(queryLower);
      }).toList();
    }

    currentList.sort((a, b) => a['word']!.compareTo(b['word']!));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Vocabulary',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                ...vocabData.keys.map((lang) {
                  return CategoryChip(
                    label: lang,
                    isSelected: selectedLanguage == lang,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          selectedLanguage = lang;
                          searchQuery = '';
                          _setTtsLanguage(lang);
                        });
                      }
                    },
                  );
                }),
                CategoryChip(
                  label: 'Favorit',
                  isSelected: selectedLanguage == 'Favorit',
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        selectedLanguage = 'Favorit';
                        searchQuery = '';
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari kata atau arti...',
                prefixIcon: const Icon(Icons.search, color: Colors.orange),
                filled: true,
                fillColor: Colors.orange.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Expanded(
            child: currentList.isEmpty
                ? const Center(child: Text("Kata tidak ditemukan."))
                : Scrollbar(
                    controller: _scrollController,
                    interactive: true,
                    thickness: 8,
                    radius: const Radius.circular(10),
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: currentList.length,
                      itemBuilder: (context, index) {
                        final item = currentList[index];
                        final isFavorited = favoriteWords.contains(
                          item['word'],
                        );

                        return VocabularyCard(
                          item: item,
                          isFavorited: isFavorited,
                          onPlayWord: () => _speak(item['word']!),
                          onPlaySentence: () =>
                              _speak(item['exampleSentence']!),
                          onToggleFavorite: () =>
                              _toggleFavorite(item['word']!),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
