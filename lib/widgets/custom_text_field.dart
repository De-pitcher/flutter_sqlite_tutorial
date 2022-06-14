import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final ValueChanged<String>? onChanged;
  const CustomTextField({
    Key? key,
    required this.title,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(title),
        fillColor: Colors.white,
      ),
      onChanged: onChanged,
    );
  }
}
