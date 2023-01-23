import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UpdateEvent extends Equatable {
  const UpdateEvent();
}

// data loading state
class LoadingUpdateEvent extends UpdateEvent {
  const LoadingUpdateEvent({id = 0, title = '', body = '', userId = 0});

  ///
  @override
  List<Object> get props => [];
  int get id => int.parse(id.toString());
  String get title => title.toString();
  String get body => body.toString();
  int get userId => int.parse(userId.toString());
}

class UpdateUserEvent extends UpdateEvent {
  const UpdateUserEvent({id = 0, title = '', body = '', userId = 0});
  @override
  List<Object> get props => [];

  int get id => int.parse(id.toString());
}
