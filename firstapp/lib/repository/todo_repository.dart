import 'package:firstapp/models/todo_model.dart';
import 'package:firstapp/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoRepository implements Repository {
  String dataUrl = 'jsonplaceholder.typicode.com';
  @override
  Future<String> deletedTodo(TodoModel todo) {
    throw UnimplementedError();
  }

  @override
  Future<String> patchCompleted(TodoModel todo) {
    throw UnimplementedError();
  }

  @override
  Future<String> postTodo(TodoModel todo) {
    throw UnimplementedError();
  }
  @override
  Future<String> putCompleted(TodoModel todo) {
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getTodoList() async {
    List<TodoModel> todoList = [];
    var url = Uri.parse('$dataUrl/completed');
    var res = await http.get(url);
    print('status code : ${res.statusCode}');
    var body = json.decode(res.body);

    for(var i=0; i< body.length; i++) {
      todoList.add(TodoModel.fromJson(body[i]));
    }

    return todoList;

  }
}
