import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart'; 
import 'package:shortly_app/data/local/prefs/user_model.dart'; 
import 'package:shortly_app/data/repo/users_repo.dart'; 

part 'user_event.dart';
part 'user_state.dart';

@lazySingleton
class UserBloc extends Bloc<UserEvent, UserState> {
  UsersRepository _usersRepository;
  UserBloc(this._usersRepository) : super();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* { 
    yield await event.excuteEvent(_usersRepository);
  }

  @override
  UserState get initialState => UserInitial();

  void getUserStatus() {
    add(GetUserStatusEvent());
  }

    void setOldUserStatus() {
    add(SetOldUserEvent());
  }
}
