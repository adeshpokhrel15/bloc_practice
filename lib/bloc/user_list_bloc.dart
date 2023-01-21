// import 'package:bloc_pratical/features/data/data_source.dart';
// import 'package:bloc_pratical/features/models/data_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// enum UserEvents { loadUsers }

// class UserListBloc extends Bloc<UserEvents, List<UserModel>> {
//   UserDataSource _userRepository = UserDataSource();

//   UserListBloc() {
//     _userRepository = UserDataSource();
//   }

//   @override
//   List<UserModel> get initialState => [];

//   void loadUsers() {
//     this.dispatch(UserEvents.loadUsers);
//   }

//   @override
//   Stream<List<UserModel>> mapEventToState(
//       List<UserModel> currentState, UserEvents event) async* {
//     switch (event) {
//       case UserEvents.loadUsers:
//         var users = await _userRepository.getUser();
//         yield users;
//     }
//   }
// }
