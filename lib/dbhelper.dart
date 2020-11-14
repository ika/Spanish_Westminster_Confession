import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:confesion_de_fe_de_westminster/chaptersModel.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  String _dbName = 'swcf.db';
  String _dbTable = 'texts';
  int _version = 1;

  static DBProvider _dbProvider;
  static Database _database;

  DBProvider._createInstance();

  factory DBProvider() {
    if (_dbProvider == null) {
      _dbProvider = DBProvider._createInstance();
    }
    return _dbProvider;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  Future<Database> initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _dbName);

    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", _dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(path, version: _version);
  }

  Future close() async {
    return _database.close();
  }

  Future<List<Chapter>> getChapters() async {
    final db = await database;
    var maps = await db.query(_dbTable);

    return List.generate(maps.length, (i) {
      //create a list of chapters
      return Chapter(
        id: maps[i]['id'],
        chap: maps[i]['chap'],
        title: maps[i]['title'],
        text: maps[i]['text'],
      );
    });
  }


}
