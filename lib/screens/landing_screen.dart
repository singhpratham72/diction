import 'package:diction/models/paragraph_model.dart';
import 'package:diction/respositories/paragraph_repository.dart';
import 'package:diction/utils/database_helper.dart';
import 'package:diction/widgets/paragraph_card.dart';
import 'package:flutter/material.dart';
import 'package:diction/constants/colors.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Paragraph> paraList = [];
  final ParagraphRepository _paragraphRepository = ParagraphRepository();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      setState(() {
        fetchDatafromDB();
      });
    });
    super.initState();
  }

  void fetchDatafromDB() async {
    List<Paragraph> dbParas = await _databaseHelper.fetchParagraohs();
    paraList.addAll(dbParas);
  }

  addParaToList() async {
    // await paragraphProvider.getParagraph();
    final response = await _paragraphRepository.fetchParagraph();
    if (response != null) {
      Paragraph newParagraph = Paragraph.fromJson(response);
      setState(() {
        paraList.add(newParagraph);
        _databaseHelper.saveParagraphs(paraList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.scaffoldColor,
      appBar: AppBar(
        title: const Text('Diction'),
        centerTitle: true,
        backgroundColor: ApplicationColors.primaryColor,
      ),
      body: paraList.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Please press the add button to add a paragraph.',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  shrinkWrap: true,
                  itemCount: paraList.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      onDismissed: (_) {
                        setState(() {
                          paraList.removeAt(index);
                          _databaseHelper.saveParagraphs(paraList);
                        });
                      },
                      key: UniqueKey(),
                      child: ParagraphCard(
                        text: paraList[index].data ?? '',
                      ),
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addParaToList();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
