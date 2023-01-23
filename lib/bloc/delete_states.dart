import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserPost extends Equatable {
  //equatable is a package that helps to compare two objects
  const UserPost();
}

// user data loading state
class PostLoadingState extends UserPost {
  @override
  List<Object> get props => [];
}

// user data loaded state
class PostLoadedState extends UserPost {
  @override
  List<Object> get props => [];
}

//user data error loading state
class PostErrorState extends UserPost {
  const PostErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
