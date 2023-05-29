import 'package:flutter/material.dart';

class ChecklistItem extends StatefulWidget {
  final String text;
  final dynamic callback;
  ChecklistItem({required this.text, required this.callback});

  @override
  State<ChecklistItem> createState() => _ChecklistItem();
}

class _ChecklistItem extends State<ChecklistItem> {
  bool _isChecked = false;

  void _check() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  void _clear() {
    widget.callback();
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
                color: _isChecked ? Colors.grey : Colors.black,
                decoration: _isChecked ? TextDecoration.lineThrough : null
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