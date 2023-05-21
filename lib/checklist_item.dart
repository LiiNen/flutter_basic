import 'package:flutter/material.dart';

class ChecklistItem extends StatefulWidget {
  final String text;
  ChecklistItem({required this.text});

  @override
  State<ChecklistItem> createState() => _ChecklistItem();
}

class _ChecklistItem extends State<ChecklistItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(widget.text)
      )
    );
  }
}