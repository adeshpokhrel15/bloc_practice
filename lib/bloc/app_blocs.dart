import 'package:bloc_pratical/bloc/app_events.dart';
import 'package:bloc_pratical/bloc/app_states.dart';
import 'package:bloc_pratical/features/data/data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserDataSource _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadingUserEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final users = await _userRepository.getUser();
        // final deleteUser = await _userRepository.deleteUser(event.id);
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
