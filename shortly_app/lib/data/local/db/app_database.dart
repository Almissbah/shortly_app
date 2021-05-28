import 'dart:async';
import 'package:floor/floor.dart';
import 'package:shortly_app/data/local/db/urls_dao.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';  
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [UrlData])
abstract class AppDatabase extends FloorDatabase {
  UrlsDao get urlsDao;
}