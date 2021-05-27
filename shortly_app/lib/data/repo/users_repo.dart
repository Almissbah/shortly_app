import 'package:shortly_app/data/local/prefs/user_model.dart';
import 'package:shortly_app/data/remote/resource.dart';

abstract class UsersRepository {
  Future<Resource<User>> getUser();
  Future<Resource> storeUser(User user);
}
