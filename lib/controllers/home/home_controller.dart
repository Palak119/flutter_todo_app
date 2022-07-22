import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<String> todoItems = <String>[].obs;

  addTodoItem(String todoItemText) {
    todoItems.add(todoItemText);
  }
}
