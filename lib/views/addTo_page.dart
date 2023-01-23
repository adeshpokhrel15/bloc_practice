// // import 'package:bloc_pratical/features/data/data_source.dart';
// // import 'package:bloc_pratical/features/models/data_model.dart';
// // import 'package:flutter/material.dart';

// // class AddToPage extends StatefulWidget {
// //   AddToPage({
// //     super.key,
// //   });
// //   UserModel? userModel;
// //   @override
// //   State<AddToPage> createState() => _AddToPageState();
// // }

// // class _AddToPageState extends State<AddToPage> {
// //   TextEditingController idController = TextEditingController();
// //   TextEditingController titleController = TextEditingController();
// //   TextEditingController descriptionController = TextEditingController();
// //   TextEditingController userIdController = TextEditingController();

// //   final UserDataSource userDataSource = UserDataSource();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Add To'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(15.0),
// //         child: ListView(
// //           children: [
// //             TextField(
// //               enabled: false,
// //               controller: idController,
// //               // ..text = widget.userModel!.that.toString(),
// //               decoration: const InputDecoration(
// //                 hintText: 'Id',
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 10,
// //             ),
// //             TextField(
// //               controller: titleController,
// //               // ..text = widget.userModel!.title.toString(),
// //               decoration: const InputDecoration(
// //                 hintText: 'Title',
// //               ),
// //             ),
// //             const SizedBox(
// //               height: 10,
// //             ),
// //             TextField(
// //               controller: descriptionController,
// //               // ..text = widget.userModel!.body.toString(),
// //               decoration: const InputDecoration(
// //                 hintText: 'Description',
// //               ),
// //               keyboardType: TextInputType.multiline,
// //               maxLines: 9,
// //             ),
// //             const SizedBox(
// //               height: 10,
// //             ),
// //             ElevatedButton(
// //                 onPressed: () {
// //                   userDataSource.postUser(
// //                     userId: int.parse(userIdController.text),
// //                     title: titleController.text,
// //                     body: descriptionController.text,
// //                   );
// //                 },
// //                 child: const Text('Add To'))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:bloc_pratical/bloc/post_blocs.dart';
// import 'package:bloc_pratical/bloc/updatepost_events.dart';
// import 'package:bloc_pratical/bloc/updatepost_states.dart';
// import 'package:bloc_pratical/features/data/data_source.dart';
// import 'package:bloc_pratical/features/models/data_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AddToPage extends StatefulWidget {
//   AddToPage({
//     super.key,
//   });
//   UserModel? userModel;
//   @override
//   State<AddToPage> createState() => _AddToPageState();
// }

// class _AddToPageState extends State<AddToPage> {
//   TextEditingController idController = TextEditingController();
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   TextEditingController userIdController = TextEditingController();

//   final UserDataSource userDataSource = UserDataSource();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Add To'),
//         ),
//         body: BlocProvider(
//           create: (context) => UpdateBloc(
//             RepositoryProvider.of<UserDataSource>(context),
//           )..add(
//               const LoadingUpdateEvent(),
//             ),
//           child: BlocBuilder<UpdateBloc, UpdatePost>(builder: (context, state) {
//             if (state is UpdateLoadingState) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (state is UpdateLoadedState) {
//               return ListView.builder(
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: SingleChildScrollView(
//                       child: ListView(
//                         shrinkWrap: true,
//                         children: [
//                           TextField(
//                             enabled: false,
//                             controller: idController,
//                             // ..text = widget.userModel!.that.toString(),
//                             decoration: const InputDecoration(
//                               hintText: 'Id',
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             controller: titleController,
//                             // ..text = widget.userModel!.title.toString(),
//                             decoration: const InputDecoration(
//                               hintText: 'Title',
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             controller: descriptionController,
//                             // ..text = widget.userModel!.body.toString(),
//                             decoration: const InputDecoration(
//                               hintText: 'Description',
//                             ),
//                             keyboardType: TextInputType.multiline,
//                             maxLines: 9,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           ElevatedButton(
//                               onPressed: () {
//                                 userDataSource.postUser(
//                                   id: int.parse(
//                                       widget.userModel!.that.toString()),
//                                   userId: int.parse(
//                                       widget.userModel!.userId.toString()),
//                                   title: titleController.text.trim(),
//                                   body: descriptionController.text.trim(),
//                                 );
//                               },
//                               child: const Text('Add To'))
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }
//             return const Center(child: CircularProgressIndicator());
//           }),
//         ));
//   }
// }
