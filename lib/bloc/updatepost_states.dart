import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UpdatePost extends Equatable {
  //equatable is a package that helps to compare two objects
  const UpdatePost();
}

// user data loading state
class UpdateLoadingState extends UpdatePost {
  @override
  List<Object> get props => [];
}

// user data loaded state
class UpdateLoadedState extends UpdatePost {
  const UpdateLoadedState();
  @override
  List<Object> get props => [];
}

//user data error loading state
class UpdateErrorState extends UpdatePost {
  const UpdateErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
