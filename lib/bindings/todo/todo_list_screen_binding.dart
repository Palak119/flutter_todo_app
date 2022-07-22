import 'package:flutter_todo_app/custom_imports.dart';
import '../../controllers/todo/todo_list_screen_controller.dart';

class TodoListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TodoListScreenController());
  }
}