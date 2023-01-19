import 'package:bloc_pratical/practice_1/features/data/data_source/model_data_source.dart';
import 'package:bloc_pratical/practice_1/features/models/models.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Container(
        child: StreamBuilder<List<Employe>>(
            stream: _employeeBloc.employeeListStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('${snapshot.data[index].id}'),
                          ),
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
