part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class FirstTimeUserState extends UserState{}

class OldUserState extends UserState{}