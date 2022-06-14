// import 'package:flutter/cupertino.dart';
// import 'package:flutter_sqlite_tutorial/models/note.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class SqLiteService {
//   static const String databaseName = 'note.db';
//   static Database? db;

//   static Future<Database> initializeDB() async {
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, databaseName);

//     return db ??
//         await openDatabase(path, version: 1,
//             onCreate: (Database db, int version) {
//           createTables(db);
//         });
//   }

//   static void createTables(Database database) {
//     database.execute('''CREATE TABLE IF NOT EXISTS Notes (
//         "Id TEXT NOT NULL,"
//         "Title TEXT NOT NULL,"
//         "Description TEXT NOT NULL"
//         )
//         ''');
//   }

//   static Future<int> createItem(Note note) async {
//     final Database db = await initializeDB();
//     final id = await db.insert(
//       'Notes',
//       note.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     return id;
//   }

//   static Future<List<Note>> getItems() async {
//     final db = await SqLiteService.initializeDB();
//     final List<Map<String, Object?>> queryResult = await db.query('Notes');

//     return queryResult.map((e) => Note.fromMap(e)).toList();
//   }

//   static Future<void> deleteItem(int id) async {
//     final db = await SqLiteService.initializeDB();

//     try {
//       await db.delete('Note', where: 'id = ?', whereArgs: [id]);
//     } catch (e) {
//       debugPrint('Something went wrong when deleting an item: $e');
//     }
//   }

//   Future<void> insertItem(Note note) async {
//     final db = await SqLiteService.initializeDB();

//     await db.insert(
//       'Notes',
//       note.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
// }
