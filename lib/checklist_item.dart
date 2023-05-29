import 'package:flutter/material.dart';

class ChecklistItem extends StatefulWidget {
  final String text;
  final bool isChecked;
  final dynamic checkCallback;
  final dynamic deleteCallback;
  ChecklistItem({required this.text, required this.isChecked, required this.checkCallback, required this.deleteCallback});

  @override
  State<ChecklistItem> createState() => _ChecklistItem();
}

class _ChecklistItem extends State<ChecklistItem> {
  void _check() async {
    widget.checkCallback();
  }

  void _clear() {
    widget.deleteCallback();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _check,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.text,
              style: TextStyle(
                color: widget.isChecked ? Colors.grey : Colors.black,
                decoration: widget.isChecked ? TextDecoration.lineThrough : null
              )
            ),
            GestureDetector(
              onTap: () {_clear();},
              child: Icon(Icons.clear, size: 20)
            )
          ]
        )
      ),
    );
  }
}