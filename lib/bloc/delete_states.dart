import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DeletePost extends Equatable {
  //equatable is a package that helps to compare two objects
  const DeletePost();
}

// user data loading state
class DeleteLoadingState extends DeletePost {
  @override
  List<Object> get props => [];
}

// user data loaded state
class DeleteLoadedState extends DeletePost {
  @override
  List<Object> get props => [];
}

//user data error loading state
class DeleteErrorState extends DeletePost {
  const DeleteErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
