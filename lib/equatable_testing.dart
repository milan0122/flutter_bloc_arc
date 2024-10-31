import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Person p = Person(name: 'Milan', age: 21);
        Person p1 = Person(name: 'Milan', age: 21);
        print(p == p1);// object will be equal with itself , otherwise false
        print(p.hashCode.toString());
        //print(p==p);
        print(p1.hashCode.toString());
      },
      child: Icon(Icons.add),),
    );
  }
}
//Equatable package return the boolean value by checking  whether two values(instance) are equals or not
class Person extends Equatable{
  final String name;
  final int age;
  const Person({required this.name, required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name,age];
  }

 // use for hash code checking
// bool operator ==(Object other)=>
// identical(this, other)||
// other is Person &&
// runtimeType == other.runtimeType &&
// name == other.name &&
// age == other.age;
// @override
// int get hashCode => name.hashCode ^ age.hashCode;