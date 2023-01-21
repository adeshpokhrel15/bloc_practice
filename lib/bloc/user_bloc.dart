// import 'package:bloc_pratical/features/data/data_source.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../features/models/data_model.dart';

// enum UserEvents { getUser, createUser, updateUser, deleteUser }

// class UserState {
//   UserModel? user;
//   bool isLoading;
//   bool isLoaded;
//   bool isDeleting;
//   bool isDeleted;
//   bool isSaved;
//   bool hasFailure;
//   bool isSaving;

//   UserState({
//     this.user,
//     this.isLoading = false,
//     this.isSaved = false,
//     this.isDeleting = false,
//     this.isDeleted = false,
//     this.isSaving = false,
//     this.hasFailure = false,
//     this.isLoaded = false,
//   });
// }

// class UserBloc extends Bloc<UserEvents, UserState> {
//   UserDataSource _userRepository;

//   UserBloc() {
//     _userRepository = UserDataSource();
//   }

//   String _id = "";
//   UserModel user;

//   @override
//   UserState get initialState => UserState();

//   void getUser(String id) {
//     _id = id;
//     this.dispatch(UserEvents.getUser);
//   }

//   void createUser(UserModel user) {
//     _user = user;
//     this.dispatch(UserEvents.createUser);
//   }

//   void updateUser(UserModel user) {
//     _user = user;
//     this.dispatch(UserEvents.updateUser);
//   }

//   void deleteUser(String id) {
//     _id = id;
//     this.dispatch(UserEvents.deleteUser);
//   }

//   @override
//   Stream<UserState> mapEventToState(
//       UserState currentState, UserEvents event) async* {
//     switch (event) {
//       case UserEvents.getUser:
//         yield UserState(isLoading: true, isLoaded: false);
//         UserModel user = await _userRepository.getUserById(_id);
//         yield UserState(user: user, isLoading: false, isLoaded: true);
//         break;

//       case UserEvents.createUser:
//         yield UserState(isSaving: true, isSaved: false);
//         bool isSuccessful = await _userRepository.createUser(_user);
//         yield UserState(
//             isSaving: false, isSaved: isSuccessful, hasFailure: !isSuccessful);
//         break;

//       case UserEvents.updateUser:
//         yield UserState(
//           isSaving: true,
//           isSaved: false,
//         );

//         bool isSuccessful = await _userRepository.updateUser(_user);

//         yield UserState(
//           isSaving: false,
//           isSaved: isSuccessful,
//           hasFailure: !isSuccessful,
//         );
//         break;

//       case UserEvents.deleteUser:
//         yield UserState(
//           isDeleting: true,
//           isDeleted: false,
//         );

//         bool isSuccessful = await _userRepository.deleteUser(id);
//         yield UserState(
//           isDeleting: false,
//           isDeleted: isSuccessful,
//           hasFailure: !isSuccessful,
//         );
//         break;
//     }
//   }
// }
