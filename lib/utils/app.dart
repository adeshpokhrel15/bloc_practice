import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../practice_2/features/data/data_source.dart';
import '../practice_2/views/blocmain_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RepositoryProvider(
          create: (context) => UserDataSource(),
          child: const BlocMainPage(),
        ));
  }
}
