import 'package:shared_preferences/shared_preferences.dart';

import '../models/paragraph_model.dart';

class DatabaseHelper {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveParagraphs(List<Paragraph> paraList) async {
    List<String> values = paraList.map((para) => para.data ?? '').toList();
    final SharedPreferences prefs = await _prefs;
    await prefs.setStringList('paras', values);
  }

  Future<List<Paragraph>> fetchParagraohs() async {
    List<Paragraph> paraList = [];
    final SharedPreferences prefs = await _prefs;
    List<String> paras = prefs.getStringList('paras') ?? [];
    for (String data in paras) {
      paraList.add(Paragraph.fromJson(data));
    }
    return paraList;
  }
}
