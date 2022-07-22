import 'package:flutter_todo_app/controllers/todo/todo_list_screen_controller.dart';
import 'package:flutter_todo_app/custom_imports.dart';

import 'components/todo_list_screen_components.dart';

class TodoListScreen extends StatefulWidget {
  final List<String> todoItems;
  const TodoListScreen({Key? key, required this.todoItems}) : super(key: key);

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  /// This is the GetX controller for the TodoListScreen
  TodoListScreenController todoListScreenController =
      Get.find<TodoListScreenController>();

  @override
  void initState() {
    super.initState();

    /// add all todo list items to the controller
    todoListScreenController.todoItems.addAll(widget.todoItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, appName),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          /// if todo list is empty, then show empty list message
          () => todoListScreenController.todoItems.isEmpty
              ? buildNoTodoFoundMessage(context)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(context, 0.02),
                      Text(todoItemsTitle, style: titleLargeTextStyle(context)),
                      verticalSpace(context, 0.02),

                      /// show todo list items
                      Expanded(
                        child: buildTodoList(),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Center buildNoTodoFoundMessage(BuildContext context) {
    return Center(
      child: Text(
        noTodoItemsTitle,
        style: titleLargeTextStyle(context),
      ),
    );
  }

  Widget buildTodoList() {
    return ScrollConfiguration(
      behavior: RemoveScrollingGlowEffect(),
      child: GridView.builder(
        itemCount: todoListScreenController.todoItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: sizeWidth(8),
          mainAxisSpacing: sizeWidth(8),
        ),
        itemBuilder: (context, index) {
          return buildTodoItem(
            context,
            todoListScreenController.todoItems[index],
            onDelete: () {
              todoListScreenController.todoItems.removeAt(index);
            },
          );
        },
      ),
    );
  }
}
