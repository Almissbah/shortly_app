// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di/api_module.dart';
import 'data/remote/shortly_api_service.dart';
import 'di/storage_module.dart';
import 'data/local/db/urls_dao.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  final storageModule = _$StorageModule();
  gh.factory<Dio>(() => apiModule.getDio());
  final resolvedSharedPreferences =
      await storageModule.provideSharedPreferences();
  gh.factory<SharedPreferences>(() => resolvedSharedPreferences);
  gh.factory<ShortlyApiService>(
      () => apiModule.getShortlyApiService(get<Dio>()));
  final resolvedUrlsDao = await storageModule.provideUrlsDao();
  gh.factory<UrlsDao>(() => resolvedUrlsDao);
  return get;
}

class _$ApiModule extends ApiModule {}

class _$StorageModule extends StorageModule {}
