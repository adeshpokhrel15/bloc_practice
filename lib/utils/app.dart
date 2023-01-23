import 'package:bloc_pratical/bloc/app_blocs.dart';
import 'package:bloc_pratical/bloc/post_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/data/data_source.dart';
import '../views/blocmain_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserDataSource()),
        ),
        BlocProvider<UpdateBloc>(
            create: (BuildContext context) => UpdateBloc(UserDataSource())),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: BlocMainPage()),
    );
  }
}
