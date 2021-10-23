import 'package:english_words/english_words.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

Function multiplier([num? value1]){
  value1 ??= 1;
  return (num value2)=>value2 * value1!;
}

class Company {
  String _name; //приватне поле

  //map
  static final Map<String, Company> list = <String, Company>{};
  List<Worker> workerList= [];

  //iменований конструктор
  Company._usingName({required String name}) : _name = name {
    assertName(name);
  }

  //фабричний конструктор
  factory Company(String name) {
    return list.putIfAbsent(name, () => Company._usingName(name: name));
  }

  //iменований фабричний конструктор
  factory Company.fromWordPair(WordPair wp) {
    String companyName = wp.asCamelCase;
    return Company(companyName);
  }

  //гетер
  String get name => _name.capitalize();

  //сетер
  set name(String value) {
    assertName(value);
    _name = value;
  }

  @override
  String toString() {
    return name;
  }

  static void assertName(String value) {
    assert((value.isNotEmpty) && (value.length <= 20));
  }

  static List<Company> createList() {
    return generateWordPairs()
        .take(10)
        .map((e) => Company.fromWordPair(e))
        .toList();
  }

}

abstract class Worker {
  final String _name;

  Worker({required String name}) : _name = name;

  String get name => _name;

  void printInfo();
}

mixin Address {
  String _officeAddress = '';

  String get address => _officeAddress;

  set address(String address) {
    assert(address.length <= 50);
    _officeAddress = address;
  }
}

class Director extends Worker with Address {
  Director({required String name}) : super(name: name);

  @override
  String printInfo() {
    if (_officeAddress.isNotEmpty) {
      return 'Company director: $name \n Company office has address: $_officeAddress';
    } else {
      return 'Company director: $name \n The company does not have office';
    }
  }
}

class Manager extends Worker with Address {

  Manager({String name = 'Bob'})
      : super(name: name); //параметр за замовчуванням

  @override
  String printInfo() {
    if (_officeAddress.isNotEmpty) {
      return 'Company manager: $name \n Company office has address: $_officeAddress';
    } else {
      return 'Company manager: $name \n The company does not have office';
    }
  }
}
