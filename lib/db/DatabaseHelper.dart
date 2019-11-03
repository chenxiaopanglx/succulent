/*
 * author: Created by 李卓原 on 2019/3/12.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:xiaopang/model/SucculentBean.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableSucculent = 'SucculentTable';
  final String id = 'id';
  final String name = 'name';
  final String url = 'url';
  final String duration = 'duration';
  final String title = 'title';
  final String favoriteStatus = 'favorite_status';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'flashgo.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableSucculent($id INTEGER PRIMARY KEY AUTOINCREMENT, $name TEXT, $url TEXT)');
  }

  Future<int> insertSucculent(SucculentBean succulentBean) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableSucculent, succulentBean.toJson());
    return result;
  }

  Future<List<SucculentBean>> selectSucculents() async {
    var dbClient = await db;
    var result = await dbClient.query(
      tableSucculent,
      columns: [id, name, url],
    );
    List<SucculentBean> videos = [];
    result.forEach((item) => videos.add(SucculentBean.fromSql(item)));
    return videos;
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
