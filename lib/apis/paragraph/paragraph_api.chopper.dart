// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paragraph_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ParagraphService extends ParagraphService {
  _$ParagraphService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ParagraphService;

  @override
  Future<Response<dynamic>> getPragraph() {
    final Uri $url = Uri.parse('http://metaphorpsum.com/paragraphs/1/4');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
