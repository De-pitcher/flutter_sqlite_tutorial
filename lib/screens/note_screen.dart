import 'package:flutter/material.dart';
import 'package:flutter_sqlite_tutorial/db/note_database.dart';
import 'package:flutter_sqlite_tutorial/models/note.dart';
import 'package:flutter_sqlite_tutorial/screens/edit_note_screen.dart';
import 'package:flutter_sqlite_tutorial/screens/note_detail_screen.dart';
import 'package:flutter_sqlite_tutorial/widgets/note_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = false);

    notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 24.0),
        ),
        actions: const [Icon(Icons.search), SizedBox(width: 12.0)],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : notes.isEmpty
                ? const Text(
                    'No Notes',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  )
                : buildNotes(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
          );

          refreshNotes();
        },
      ),
    );
  }

  Widget buildNotes() => ListView.builder(
        itemCount: notes.length,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailScreen(noteId: note.id!),
              ));

              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}
