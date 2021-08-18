import 'package:comp_ia/model/Project.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final database = initDataBase();

Future<Database> initDataBase() async {
  final database = openDatabase(
      join(await getDatabasesPath(), 'projects_database.db'),
      onCreate: (db, version) {
        return db.execute('CREATE TABLE projects(id INTEGER PRIMARY KEY, name TEXT, language TEXT, text TEXT, translatedText TEXT)');
      },
      version: 1
  );

  return database;
}

Future<void> insertProject(Project project) async {
  // Get a reference to the database.
  final db = await database;


  await db.insert(
    'projects',
    project.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Project>> projects() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('projects');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Project(
      name: maps[i]['name'],
      language: maps[i]['language'],
      text: maps[i]['text'],
      translatedText: maps[i]['translatedText']
    );
  });
}

Future<void> deleteProject(String name) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'projects',
    // Use a `where` clause to delete a specific dog.
    where: 'name = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [name],
  );
}
