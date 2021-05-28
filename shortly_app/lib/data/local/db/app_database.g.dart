// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UrlsDao _urlsDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UrlData` (`id` INTEGER, `code` TEXT, `shortLink` TEXT, `fullShortLink` TEXT, `shortLink2` TEXT, `fullShortLink2` TEXT, `shareLink` TEXT, `fullShareLink` TEXT, `originalLink` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UrlsDao get urlsDao {
    return _urlsDaoInstance ??= _$UrlsDao(database, changeListener);
  }
}

class _$UrlsDao extends UrlsDao {
  _$UrlsDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _urlDataInsertionAdapter = InsertionAdapter(
            database,
            'UrlData',
            (UrlData item) => <String, dynamic>{
                  'id': item.id,
                  'code': item.code,
                  'shortLink': item.shortLink,
                  'fullShortLink': item.fullShortLink,
                  'shortLink2': item.shortLink2,
                  'fullShortLink2': item.fullShortLink2,
                  'shareLink': item.shareLink,
                  'fullShareLink': item.fullShareLink,
                  'originalLink': item.originalLink
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UrlData> _urlDataInsertionAdapter;

  @override
  Future<List<UrlData>> findAllUrls() async {
    return _queryAdapter.queryList('SELECT * FROM UrlData',
        mapper: (Map<String, dynamic> row) => UrlData(
            row['shortLink'] as String,
            row['fullShortLink'] as String,
            row['shortLink2'] as String,
            row['fullShortLink2'] as String,
            row['shareLink'] as String,
            row['fullShareLink'] as String,
            row['originalLink'] as String,
            row['id'] as int,
            row['code'] as String));
  }

  @override
  Future<void> insertUrl(UrlData urlData) async {
    await _urlDataInsertionAdapter.insert(urlData, OnConflictStrategy.abort);
  }
}
