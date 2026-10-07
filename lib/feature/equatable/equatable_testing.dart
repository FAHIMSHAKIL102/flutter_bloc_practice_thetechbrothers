import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Equatable')),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Person person = Person(name: 'Fahim', age: 25);
          Person person1 = Person(name: 'Fahim', age: 25);
          print(person == person1);
          print(person == person);
          print(person.hashCode.toString());
          print(person1.hashCode.toString());
        },
        child: Icon(Icons.drag_handle),
      ),
    );
  }
}

class Person extends Equatable {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}
