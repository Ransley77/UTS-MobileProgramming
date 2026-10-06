import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../data/vocabulary_data.dart';
import '../widgets/vocabulary/audio_button.dart';
import '../widgets/vocabulary/example_sentence.dart';
import '../widgets/vocabulary/word_detail.dart';

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
                ...vocabData.keys.map((lang) => _buildFilterChip(lang)),
                _buildFilterChip('Favorit'),
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

                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Colors.orange.shade100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['word']!,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        WordDetail(
                                          partOfSpeech:
                                              item['partOfSpeech'] ?? 'noun',
                                          phonetic: item['phonetic'] ?? '',
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item['translation']!,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        AudioButton(
                                          audioUrl: '',
                                          onPlay: () => _speak(item['word']!),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            isFavorited
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: isFavorited
                                                ? Colors.red
                                                : Colors.grey,
                                          ),
                                          onPressed: () =>
                                              _toggleFavorite(item['word']!),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(height: 24),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ExampleSentence(
                                        sentence: item['exampleSentence']!,
                                        meaning: item['exampleTranslation']!,
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.volume_up,
                                        size: 20,
                                        color: Colors.orange,
                                      ),
                                      onPressed: () =>
                                          _speak(item['exampleSentence']!),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    final isSelected = selectedLanguage == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(
          label == 'Favorit' ? '❤ Favorit' : label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.orange),
        ),
        selected: isSelected,
        selectedColor: Colors.orange,
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.orange),
        onSelected: (bool selected) {
          if (selected) {
            setState(() {
              selectedLanguage = label;
              searchQuery = '';
              if (label != 'Favorit') {
                _setTtsLanguage(label);
              }
            });
          }
        },
      ),
    );
  }
}
