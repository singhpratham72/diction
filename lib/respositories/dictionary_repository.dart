import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:diction/apis/dictionary/dictionary_api.dart';

import 'package:diction/constants/api_constants.dart';
import 'package:diction/models/word_definition_model.dart';

class DictionaryRepository {
  final ChopperClient chopper;

  DictionaryRepository()
      : chopper = ChopperClient(
          baseUrl: Uri.parse(APIConstants.dictionaryBaseURL),
          services: [DictionaryService.create()],
        );

  Future<WordDefinition?> fetchMeaning(String word) async {
    final dictionaryService = chopper.getService<DictionaryService>();
    final response = await dictionaryService.getMeaning(word);
    if (response.isSuccessful) {
      // Successful request
      final json = jsonDecode(response.bodyString);
      final wordDefinition =
          WordDefinition.fromJson(json[0] as Map<String, dynamic>);
      return wordDefinition;
    } else {
      // Error code received from server
      // final error = response.error;
      return null;
    }
  }
}
