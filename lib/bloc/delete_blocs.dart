import 'package:bloc_pratical/bloc/delete_events.dart';
import 'package:bloc_pratical/bloc/delete_states.dart';
import 'package:bloc_pratical/features/data/data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeletePost> {
  final UserDataSource _userRepository;

  DeleteBloc(this._userRepository) : super(DeleteLoadingState()) {
    on<LoadingDeleteEvent>((event, emit) async {
      emit(DeleteLoadingState());

      try {
        final users = await _userRepository.deleteUser(event.id);
        // final deleteUser = await _userRepository.deleteUser(event.id);
        emit(DeleteLoadedState());
      } catch (e) {
        emit(DeleteErrorState(e.toString()));
      }
    });
  }
}
