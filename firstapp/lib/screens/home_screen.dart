import 'package:firstapp/controller/todo_controller.dart';
import 'package:firstapp/repository/todo_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todoController = TodoController(TodoRepository());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api'),
        centerTitle: true,
      ),
    );
  }
}