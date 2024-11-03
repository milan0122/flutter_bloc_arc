import 'package:flutter/material.dart';
class ToDoView extends StatefulWidget {
  const ToDoView({super.key});

  @override
  State<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends State<ToDoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App')
      ),
      body: Column(
        children: [
          ListView.builder(itemBuilder: (context,index){
            return ListTile(

            );
          })
        ],
      ),
    );
  }
}
