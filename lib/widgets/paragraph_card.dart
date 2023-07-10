import 'package:diction/screens/paragraph_grid_screen.dart';
import 'package:diction/utils/navigation_helper.dart';
import 'package:flutter/material.dart';

class ParagraphCard extends StatelessWidget {
  const ParagraphCard({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationHelper().push(context, ParagraphGridScreen(data: text));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 6,
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(text),
        ),
      ),
    );
  }
}
