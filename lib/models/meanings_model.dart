import 'package:diction/models/definitions_model.dart';

class Meanings {
  final String? partOfSpeech;
  final List<Definitions>? definitions;
  final List<String>? synonyms;
  final List<dynamic>? antonyms;

  Meanings({
    this.partOfSpeech,
    this.definitions,
    this.synonyms,
    this.antonyms,
  });

  Meanings.fromJson(Map<String, dynamic> json)
      : partOfSpeech = json['partOfSpeech'] as String?,
        definitions = (json['definitions'] as List?)
            ?.map(
                (dynamic e) => Definitions.fromJson(e as Map<String, dynamic>))
            .toList(),
        synonyms = (json['synonyms'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        antonyms = json['antonyms'] as List?;

  Map<String, dynamic> toJson() => {
        'partOfSpeech': partOfSpeech,
        'definitions': definitions?.map((e) => e.toJson()).toList(),
        'synonyms': synonyms,
        'antonyms': antonyms
      };
}
