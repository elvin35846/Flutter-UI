import 'package:firstapp/models/todo_model.dart';
import 'package:firstapp/repository/repository.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);


  //get
  Future<List<TodoModel>> fetchTodoList() async {
    return _repository.getTodoList();
  }
}