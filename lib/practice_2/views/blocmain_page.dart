import 'package:bloc_pratical/practice_2/bloc/app_states.dart';
import 'package:bloc_pratical/practice_2/features/data/data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_blocs.dart';
import '../bloc/app_events.dart';
import '../features/models/data_model.dart';

class BlocMainPage extends StatelessWidget {
  const BlocMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bloc'),
        ),
        body: BlocProvider(
          create: (context) => UserBloc(
            RepositoryProvider.of<UserDataSource>(context),
          )..add(LoadingUserEvent()),
          child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<UserModel> usersList = state.users;
              return ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(usersList[index].firstName),
                    subtitle: Text(usersList[index].email),
                  );
                },
              );
            }
            return Container();
          }),
        ));
  }
}
