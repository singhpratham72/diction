// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$DictionaryService extends DictionaryService {
  _$DictionaryService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = DictionaryService;

  @override
  Future<Response<dynamic>> getMeaning(String word) {
    final Uri $url =
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/${word}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
