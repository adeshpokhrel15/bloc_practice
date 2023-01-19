import 'dart:async';

import 'package:bloc_pratical/practice_1/features/models/models.dart';

class EmployeeBloc {
  //list of employess
  final List<Employe> _employeeList = [
    Employe(1, 'adesh', 10000.0),
    Employe(2, 'suresh', 20000.0),
    Employe(3, 'ramesh', 30000.0),
  ];
// stream controller
  final _employeeListStreamController = StreamController<List<Employe>>();

  // for incresing and decresing salary

  final _employeeIncStreeamController = StreamController<Employe>();

  final _employeeDecStreeamController = StreamController<Employe>();

  //getters
  Stream<List<Employe>> get employeeListStream =>
      _employeeListStreamController.stream;

  StreamSink<List<Employe>> get employeeListSink =>
      _employeeListStreamController.sink;

  StreamSink<Employe> get employeeSalaryIncrement =>
      _employeeIncStreeamController.sink;

  StreamSink<Employe> get employeeSalaryDecrement =>
      _employeeIncStreeamController.sink;

  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);
    _employeeIncStreeamController.stream.listen(_incrementSalary);
    _employeeDecStreeamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employe employee) {
    double salary = employee.salary;
    double incremented = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary + incremented;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employe employee) {
    double salary = employee.salary;
    double decremented = salary * 20 / 100;
    _employeeList[employee.id - 1].salary = salary + decremented;
    employeeListSink.add(_employeeList);
  }

  void dispose() {
    _employeeIncStreeamController.close();
    _employeeDecStreeamController.close();
    _employeeListStreamController.close();
  }
}
