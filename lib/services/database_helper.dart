import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    String path = join(
      await getDatabasesPath(),
      'vocab1.db',
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE words(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            english TEXT,
            persian TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertWord(
      String english, String persian) async {
    final db = await database;

    return await db.insert(
      'words',
      {
        'english': english,
        'persian': persian,
      },
    );
  }

  static Future<List<Map<String, dynamic>>> getWords() async {
    final db = await database;

    return await db.query('words');
  }
}