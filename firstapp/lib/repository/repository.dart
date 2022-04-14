

import 'package:firstapp/models/todo_model.dart';

abstract class Repository {
  Future<List<TodoModel>> getTodoList();
  Future<String> patchCompleted(TodoModel todo);
  Future<String> putCompleted(TodoModel todo);
  Future<String> deletedTodo(TodoModel todo);
  Future<String> postTodo(TodoModel todo);
}