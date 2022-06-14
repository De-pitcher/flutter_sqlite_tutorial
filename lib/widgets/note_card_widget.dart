import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_sqlite_tutorial/constants.dart';
import 'package:flutter_sqlite_tutorial/models/note.dart';

class NoteCardWidget extends StatelessWidget {
  final Note note;
  final int index;
  const NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = lightColors[index % lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    final minHeight = getMinHeight(index);
    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 4.0),
            Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
