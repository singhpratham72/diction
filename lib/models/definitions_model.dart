class Definitions {
  final String? definition;
  final String? example;
  final List<dynamic>? synonyms;
  final List<dynamic>? antonyms;

  Definitions({
    this.definition,
    this.example,
    this.synonyms,
    this.antonyms,
  });

  Definitions.fromJson(Map<String, dynamic> json)
      : definition = json['definition'] as String?,
        example = json['example'] as String?,
        synonyms = json['synonyms'] as List?,
        antonyms = json['antonyms'] as List?;

  Map<String, dynamic> toJson() => {
        'definition': definition,
        'example': example,
        'synonyms': synonyms,
        'antonyms': antonyms
      };
}
