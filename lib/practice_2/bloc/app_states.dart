import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../features/models/data_model.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();
}

// data loading state
class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

// data loaded state
class UserLoadedState extends UserState {
  const UserLoadedState(this.users);
  final List<UserModel> users;
  @override
  List<Object> get props => [users];
}

//error loading state
class UserErrorState extends UserState {
  const UserErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
