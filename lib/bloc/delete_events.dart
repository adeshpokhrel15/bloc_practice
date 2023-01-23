import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class PostEvent extends Equatable {
  const PostEvent();
}

// data loading state
class LoadingPostEvent extends PostEvent {
  const LoadingPostEvent({id = 0});
  @override
  List<Object> get props => [];
  int get id => int.parse(id.toString());
}

class DeletPostEvent extends PostEvent {
  const DeletPostEvent({id = 0});
  @override
  List<Object> get props => [];

  int get id => int.parse(id.toString());
}
