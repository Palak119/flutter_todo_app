import 'package:get/get.dart';

import '../bindings/home/home_binding.dart';
import '../bindings/other/demo_ui_screen_binding.dart';
import '../bindings/todo/todo_list_screen_binding.dart';
import '../screens/home/home_screen.dart';
import '../screens/other/demo_ui_screen.dart';
import '../screens/todo/todo_list_screen.dart';
import 'screen_routes.dart';

class Routes {
  static final routes = [
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: todoListScreenBinding,
      page: () => const TodoListScreen(todoItems: []),
      binding: TodoListScreenBinding(),
    ),
    GetPage(
      name: demoUIScreen,
      page: () => const DemoUiScreen(),
      binding: DemoUIScreenBinding(),
    ),
  ];
}
