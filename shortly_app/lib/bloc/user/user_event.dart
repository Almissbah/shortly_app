part of 'user_bloc.dart';

@immutable
abstract class UserEvent {
  Future<UserState> excuteEvent(UsersRepository repository);
}

class GetUserStatusEvent extends UserEvent {
  @override
  Future<UserState> excuteEvent(UsersRepository repository) async {
    var response = await repository.getUser();
    var user = response.payload;
    if (user.userStatus == UserStatus.FirstTimeUser)
      return FirstTimeUserState();
    else {
      return OldUserState();
    }
  }
}

class SetOldUserEvent extends UserEvent {
  @override
  Future<UserState> excuteEvent(UsersRepository repository) async {
    await repository.storeUser(User(userStatus: UserStatus.OldUser));
    return OldUserState();
  }
}
