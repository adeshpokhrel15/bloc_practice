import 'package:bloc_pratical/bloc/delete_events.dart';
import 'package:bloc_pratical/bloc/delete_states.dart';
import 'package:bloc_pratical/features/data/data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<PostEvent, UserPost> {
  final UserDataSource _userRepository;

  UserBloc(this._userRepository) : super(PostLoadingState()) {
    on<LoadingPostEvent>((event, emit) async {
      emit(PostLoadingState());

      try {
        final users = await _userRepository.deleteUser(event.id);
        // final deleteUser = await _userRepository.deleteUser(event.id);
        emit(PostLoadedState());
      } catch (e) {
        emit(PostErrorState(e.toString()));
      }
    });
  }
}
