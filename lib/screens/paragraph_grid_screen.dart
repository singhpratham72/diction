import 'package:diction/constants/colors.dart';
import 'package:diction/constants/textstyles.dart';
import 'package:diction/respositories/dictionary_repository.dart';
import 'package:diction/widgets/word_meaning_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ParagraphGridScreen extends StatefulWidget {
  const ParagraphGridScreen({required this.data, Key? key}) : super(key: key);
  final String data;

  @override
  State<ParagraphGridScreen> createState() => _ParagraphGridScreenState();
}

class _ParagraphGridScreenState extends State<ParagraphGridScreen> {
  late List<String> words;
  final DictionaryRepository _dictionaryRepository = DictionaryRepository();

  @override
  void initState() {
    super.initState();
    words =
        widget.data.toLowerCase().replaceAll(RegExp(r',|\.'), '').split(' ');
  }

  void showWordMeaning(BuildContext context, String word) async {
    final wordDefinition = await _dictionaryRepository.fetchMeaning(word);
    if (context.mounted && wordDefinition != null) {
      showModalBottomSheet<dynamic>(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        isScrollControlled: false,
        builder: (BuildContext context) {
          return WordMeaningBottomSheet(
            wordDefinition: wordDefinition,
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Sorry, the meaning of this word is not available.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap for meaning'),
        centerTitle: true,
        backgroundColor: ApplicationColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 2.0,
            runSpacing: 2.0,
            children: words.map((word) {
              return GestureDetector(
                onTap: () {
                  showWordMeaning(context, word);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      word,
                      style: TextStyles.bodyText,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
