import 'package:bloc_pratical/bloc/app_states.dart';
import 'package:bloc_pratical/features/data/data_source.dart';
import 'package:bloc_pratical/views/addTo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_blocs.dart';
import '../bloc/app_events.dart';
import '../features/models/data_model.dart';

class BlocMainPage extends StatelessWidget {
  const BlocMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataSource userDataSource = UserDataSource();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bloc'),
        ),
        body: BlocProvider(
          create: (context) => UserBloc(
            RepositoryProvider.of<UserDataSource>(context),
          )..add(const LoadingUserEvent()),
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
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SingleChildScrollView(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    color: Colors.blue,
                                    child:
                                        Text(usersList[index].that.toString())),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    usersList[index].title,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(usersList[index].body),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddToPage(
                                                        userModel:
                                                            usersList[index],
                                                      )));
                                        },
                                        child: const Text(
                                          'Edit',
                                          style: TextStyle(color: Colors.green),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          userDataSource.deleteUser(
                                              usersList[index].userId);
                                        },
                                        child: const Text(
                                          'Delete',
                                          style: TextStyle(color: Colors.red),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddToPage(
                      userModel:
                          UserModel(userId: 0, title: '', body: '', that: 1),
                    )));
          },
          child: const Icon(Icons.add),
        ));
  }
}
