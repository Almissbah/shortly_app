import 'package:injectable/injectable.dart';
import 'package:shortly_app/data/local/prefs/shared_perf_manager.dart';
import 'package:shortly_app/data/local/prefs/user_model.dart';
import 'package:shortly_app/data/remote/resource.dart';

import '../../injection.dart';

abstract class UsersRepository {
  Future<Resource<User>> getUser();
  Future<Resource> storeUser(User user);
}

@LazySingleton(as: UsersRepository, env: [Env.prod])
class UsersRepoImpl extends UsersRepository {
  final SharedPrefrencesManager sharedPrefrencesManager;

  UsersRepoImpl(this.sharedPrefrencesManager);

  @override
  Future<Resource<User>> getUser() async {
    var user = await sharedPrefrencesManager.getStoredUser();
    return SuccessResource(user);
  }

  @override
  Future<Resource> storeUser(User user) async {
    await sharedPrefrencesManager.storeUser(user);
    return SuccessResource(user);
  }
}



@Singleton(as: UsersRepository,env: [Env.test])
class MockedUsersRepo extends UsersRepository{
  User currentUser=User();
  @override
  Future<Resource<User>> getUser() async {
  await Future.delayed(Duration(milliseconds: 500));
  return SuccessResource(currentUser);
  }

  @override
  Future<Resource> storeUser(User user) async {
   await Future.delayed(Duration(milliseconds: 500));
   currentUser.userStatus=UserStatus.OldUser;
  return SuccessResource(currentUser);
  }
}
