import 'package:bloc_pratical/bloc/updatepost_events.dart';
import 'package:bloc_pratical/bloc/updatepost_states.dart';
import 'package:bloc_pratical/features/data/data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdatePost> {
  final UserDataSource _userRepository;

  UpdateBloc(this._userRepository) : super(UpdateLoadingState()) {
    on<LoadingUpdateEvent>((event, emit) async {
      emit(UpdateLoadingState());

      try {
        final users = await _userRepository.postUser(
            id: event.id,
            body: event.body,
            title: event.title,
            userId: event.userId);
        // final deleteUser = await _userRepository.deleteUser(event.id);
        emit(const UpdateLoadedState());
      } catch (e) {
        emit(UpdateErrorState(e.toString()));
      }
    });
  }
}
