import 'package:flutter/material.dart';

class TitleFormField extends StatelessWidget {
  final String? title;
  final ValueChanged<String>? onChangedTitle;
  const TitleFormField({Key? key, this.title, this.onChangedTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      initialValue: title,
      style: const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Title',
        hintStyle: TextStyle(color: Colors.white70),
      ),
      validator: (title) =>
          title != null && title.isEmpty ? 'The title cannot be empty' : null,
      onChanged: onChangedTitle,
    );
  }
}

class DescriptionFormField extends StatelessWidget {
  final String? description;
  final ValueChanged<String>? onChangedDescription;
  const DescriptionFormField(
      {Key? key, this.description, this.onChangedDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      initialValue: description,
      style: const TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Title',
        hintStyle: TextStyle(color: Colors.white70),
      ),
      validator: (title) => title != null && title.isEmpty
          ? 'The description cannot be empty'
          : null,
      onChanged: onChangedDescription,
    );
  }
}
