import 'package:floor/floor.dart';
import 'package:shortly_app/data/remote/model/shorten_url_response.dart';

@dao
abstract class UrlsDao {
  @Query('SELECT * FROM UrlData ORDER BY id DESC ')
  Future<List<UrlData>> findAllUrls();

  @insert
  Future<void> insertUrl(UrlData urlData);

  @Query('DELETE FROM UrlData WHERE id = :id')
  Future<UrlData> deleteUrl(int id);
}
