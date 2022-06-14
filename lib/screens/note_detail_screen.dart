// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_sqlite_tutorial/db/note_database.dart';
import 'package:flutter_sqlite_tutorial/models/note.dart';
import 'package:flutter_sqlite_tutorial/screens/edit_note_screen.dart';

class NoteDetailScreen extends StatefulWidget {
  final int noteId;

  const NoteDetailScreen({Key? key, required this.noteId}) : super(key: key);

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }

  Widget editButton() => IconButton(
        onPressed: () async {
          if (isLoading) return;

          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddEditNoteScreen(note: note),
          ));

          refreshNote();
        },
        icon: const Icon(Icons.edit_outlined),
      );

  Widget deleteButton() => IconButton(
        onPressed: () async {
          await NotesDatabase.instance.delete(widget.noteId);

          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.delete),
      );
}
