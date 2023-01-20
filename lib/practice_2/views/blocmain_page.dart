import 'package:bloc_pratical/practice_2/bloc/app_states.dart';
import 'package:bloc_pratical/practice_2/features/data/data_source.dart';
import 'package:bloc_pratical/practice_2/views/details_page.dart';
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
                                  onTap: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             DetailsPage(usersList[index])));
                                  },
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
                                        onPressed: () {},
                                        child: const Text(
                                          'Edit',
                                          style: TextStyle(color: Colors.green),
                                        )),
                                    TextButton(
                                        onPressed: () {},
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
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddToPage()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
