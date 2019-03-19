import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';

class NewDbProvider {
  Database db;
  
  init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path =join(documentDirectory.path, "items.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          Create TABLE Items
          (
            id INTEGER PRIMARY KEY,
            delelted INTEGER,
            type TEXT,
            by TEXT, 
            time INTEGER,
            text TEXT,
            dead INTEGER,
            parent INTETER,
            kids BLOB,
            url TEXT,
            score TEXT,
            title TEXT,
            parts TEXT,
            descendants INTEGER
          )
        """);
      }
    );
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id]
    );

    if (maps.length > 0 ) {
      return ItemModel.fromDB(maps.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel items) {
    return db.insert("Items", items.toMap());
  }
}