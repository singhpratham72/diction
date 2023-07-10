import 'package:diction/models/meanings_model.dart';

class WordDefinition {
  final String? word;
  final List<Meanings>? meanings;

  WordDefinition({
    this.word,
    this.meanings,
  });

  WordDefinition.fromJson(Map<String, dynamic> json)
      : word = json['word'] as String?,
        meanings = (json['meanings'] as List?)
            ?.map((dynamic e) => Meanings.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'word': word, 'meanings': meanings?.map((e) => e.toJson()).toList()};
}
