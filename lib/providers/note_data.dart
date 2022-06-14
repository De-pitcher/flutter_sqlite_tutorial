// import 'dart:collection';

// import 'package:flutter/material.dart';
// import 'package:flutter_sqlite_tutorial/models/note.dart';
// import 'package:flutter_sqlite_tutorial/services/sqlite_service.dart';

// class NoteData extends ChangeNotifier {
//   late SqLiteService _sqLiteService;

//   static List<Note> _notes = [
//     // Note(id: 'id', description: 'description'),
//   ];

//   UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

//   static void initializeDB() async {
//     // _sqLiteService = SqLiteService();
//     SqLiteService.initializeDB().whenComplete(() async {
//       final data = await SqLiteService.getItems();
//       _notes = data;
//     });
//   }

//   Future<void> addNote(Note note) async {
//     await _sqLiteService.insertItem(note);
//     notifyListeners();
//   }

//   // void deleteNote(Note note) {
//   //   SqLiteService.deleteItem(note.id);
//   //   notifyListeners();
//   // }

//   bool get isNotEmpty => _notes.isNotEmpty;

//   int get noteCount => _notes.length;
// }
