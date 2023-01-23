import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DeleteEvent extends Equatable {
  const DeleteEvent();
}

// data loading state
class LoadingDeleteEvent extends DeleteEvent {
  const LoadingDeleteEvent({id = 0});
  @override
  List<Object> get props => [];
  int get id => int.parse(id.toString());
}

class DeletPostEvent extends DeleteEvent {
  const DeletPostEvent({id = 0});
  @override
  List<Object> get props => [];

  int get id => int.parse(id.toString());
}
