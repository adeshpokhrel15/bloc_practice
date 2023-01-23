import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DeleteEvent extends Equatable {
  const DeleteEvent();
}

// data loading state
class LoadingDeleteEvent extends DeleteEvent {
  const LoadingDeleteEvent({id = 0, title = '', body = '', userId = 0});

  ///
  @override
  List<Object> get props => [];
  int get id => int.parse(id.toString());
  String get title => title.toString();
  String get body => body.toString();
  int get userId => int.parse(userId.toString());
}

class DeletedeleteEvent extends DeleteEvent {
  const DeletedeleteEvent({id = 0, title = '', body = '', userId = 0});
  @override
  List<Object> get props => [];

  int get id => int.parse(id.toString());
}
