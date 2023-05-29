import 'package:get/get.dart';


import 'db.dart';
import 'todo_model.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    readAll();
  }

  Future<void> create(String text ) async {
    final todo = Todo(
      text: text,
      
    );
    await TodoDatabase.instance.create(todo);
    readAll();
    update(); 
  }

  Future<void> readAll() async {
    final allTodos = await TodoDatabase.instance.readAll();
    todos.value = allTodos;
  }

  Future<void> updateDB(Todo todo) async {
    await TodoDatabase.instance.update(todo);
    readAll();
  }

  Future<void> delete(Todo todo) async {
    await TodoDatabase.instance.delete(todo);
   readAll();
}
}