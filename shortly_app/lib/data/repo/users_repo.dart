import 'package:shortly_app/data/local/prefs/shared_perf_manager.dart';
import 'package:shortly_app/data/local/prefs/user_model.dart';
import 'package:shortly_app/data/remote/resource.dart';

abstract class UsersRepository {
  Future<Resource<User>> getUser();
  Future<Resource> storeUser(User user);
}

class UsersRepoImpl extends UsersRepository {
  final SharedPrefrencesManager _sharedPrefrencesManager;

  UsersRepoImpl(this._sharedPrefrencesManager);

  @override
  Future<Resource<User>> getUser() async {
    var user = await _sharedPrefrencesManager.getStoredUser();
    return SuccessResource(user);
  }

  @override
  Future<Resource> storeUser(User user) async {
    await _sharedPrefrencesManager.storeUser(user);
    return SuccessResource(user);
  }
}
