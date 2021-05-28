// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di/api_module.dart';
import 'data/local/prefs/shared_perf_manager.dart';
import 'data/remote/shortly_api_service.dart';
import 'di/storage_module.dart';
import 'bloc/urls/url_bloc.dart';
import 'data/local/db/urls_dao.dart';
import 'data/repo/urls_repo.dart';
import 'bloc/user/user_bloc.dart';
import 'data/repo/users_repo.dart';

/// Environment names
const _prod = 'prod';
const _test = 'test';

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
  gh.lazySingleton<UsersRepository>(
      () => UsersRepoImpl(get<SharedPrefrencesManager>()),
      registerFor: {_prod});
  gh.lazySingleton<UrlBloc>(() => UrlBloc(get<UrlsRepository>()));
  gh.lazySingleton<UserBloc>(() => UserBloc(get<UsersRepository>()));

  // Eager singletons must be registered in the right order
  gh.singleton<SharedPrefrencesManager>(
      SharedPrefrencesManager(get<SharedPreferences>()));
  gh.singleton<UrlsRepository>(
      UrlsRepositoryImpl(get<ShortlyApiService>(), get<UrlsDao>()),
      registerFor: {_prod});
  gh.singleton<UrlsRepository>(MockedUrlsRepo(), registerFor: {_test});
  gh.singleton<UsersRepository>(MockedUsersRepo(), registerFor: {_test});
  return get;
}

class _$ApiModule extends ApiModule {}

class _$StorageModule extends StorageModule {}
