import 'dart:convert';

class Paragraph {
  final String? data;

  Paragraph({
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data,
    };
  }

  // factory Paragraph.fromMap(Map<String, dyn) {
  //   return Paragraph(
  //     data: map[],
  //   );
  // }

  String toJson() => json.encode(toMap());

  factory Paragraph.fromJson(String source) => Paragraph(data: source);
}
