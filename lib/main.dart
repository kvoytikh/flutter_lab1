import 'package:flutter/material.dart';
import 'base.dart';

void main() {
  runApp(MyApp());

  Company company1 = Company('Company1');

  print(Company.list);

  Director director1 = Director(name: 'Alyona Olyinik');

  Manager manager1 = Manager();
  Manager manager2 = Manager(name: 'Anastasia Fan')
    ..address = 'street One';
  print(manager1.printInfo());
  print(manager2.printInfo());

  company1.workerList.add(director1);
  company1.workerList.add(manager2);
  print(company1.workerList);

  var multiply = multiplier(2);
  print('The result of multiplier: ${multiply(5.2)}');

  var multiply2 = multiplier();
  print('The result of multiplier: ${multiply2(5.2)}');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kristina Voytikh',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Companies(),
    );
  }
}

class Companies extends StatefulWidget {
  const Companies({Key? key}) : super(key: key);

  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  final _companies = <Company>[];
  final _biggerFont = const TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kristina Voytikh'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();

            final index = i ~/ 1;
            if (index >= _companies.length) {
              _companies.addAll(Company.createList());
            }
            return _buildRow(_companies[index]);
          }),
    );
  }


  Widget _buildRow(Company company) {
    return ListTile(
      title: Text(
        company.toString(),
        style: _biggerFont,
      ),
    );
  }
}
