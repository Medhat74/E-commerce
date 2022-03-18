part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {}

class UserErrorState extends UserState {}
