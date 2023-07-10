import 'package:diction/constants/textstyles.dart';
import 'package:diction/models/definitions_model.dart';
import 'package:diction/models/meanings_model.dart';
import 'package:diction/models/word_definition_model.dart';
import 'package:flutter/material.dart';

class WordMeaningBottomSheet extends StatelessWidget {
  const WordMeaningBottomSheet({
    super.key,
    required this.wordDefinition,
  });

  final WordDefinition wordDefinition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            wordDefinition.word ?? '',
            style: TextStyles.h2,
          ),
          const SizedBox(height: 16.0),
          if (wordDefinition.meanings?.isNotEmpty ?? false)
            for (final meaning in wordDefinition.meanings ?? <Meanings>[])
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meaning.partOfSpeech ?? '',
                    style: TextStyles.h3,
                  ),
                  const SizedBox(height: 8.0),
                  for (final definition
                      in meaning.definitions ?? <Definitions>[])
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ${definition.definition}',
                        ),
                        if (definition.example?.isNotEmpty ?? false)
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Example: ${definition.example}',
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        const SizedBox(height: 4.0),
                      ],
                    ),
                  const SizedBox(height: 16.0),
                ],
              ),
        ],
      ),
    );
  }
}
