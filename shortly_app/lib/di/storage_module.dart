import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shortly_app/data/local/db/app_database.dart';
import 'package:shortly_app/data/local/db/urls_dao.dart';
 
@module
abstract class StorageModule {
   @preResolve
  Future<UrlsDao> provideUrlsDao() async {
    var database = await $FloorAppDatabase
        .databaseBuilder('app_database.db') 
        .build();
    return database.urlsDao;
  }  

  @preResolve
  Future<SharedPreferences> provideSharedPreferences() async {
    return SharedPreferences.getInstance();
  }
}
