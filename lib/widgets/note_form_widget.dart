import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite_tutorial/widgets/text_form_fields.dart';

class NoteFormWidget extends StatelessWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  const NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title,
    this.description,
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Switch(
                  value: isImportant ?? false,
                  onChanged: onChangedImportant,
                ),
                Expanded(
                  child: Slider(
                    value: (number ?? 0).toDouble(),
                    min: 0,
                    max: 5,
                    divisions: 5,
                    onChanged: (number) => onChangedNumber(number.toInt()),
                  ),
                ),
              ],
            ),
            TitleFormField(title: title, onChangedTitle: onChangedTitle),
            const SizedBox(height: 8.0),
            DescriptionFormField(
              description: description,
              onChangedDescription: onChangedDescription,
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
