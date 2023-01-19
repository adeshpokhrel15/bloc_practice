// ignore_for_file: public_member_api_docs, sort_constructors_first

class Employe {
  int _id;
  String _name;
  double _salary;
  Employe(
    this._id,
    this._name,
    this._salary,
  );

  //setter
  set id(int id) {
    _id = id;
  }

  set name(String name) {
    _name = name;
  }

  set salary(double salary) {
    _salary = salary;
  }

  //getter
  int get id => _id;
  String get name => _name;
  double get salary => _salary;
}
