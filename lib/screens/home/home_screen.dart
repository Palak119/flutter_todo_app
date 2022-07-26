import '../../bindings/todo/todo_list_screen_binding.dart';
import '../../custom_imports.dart';
import '../../controllers/home/home_controller.dart';
import '../todo/todo_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// This is the GetX controller for the HomeScreen
  HomeController homeController = Get.find<HomeController>();

  /// Text controller for the todo item text field
  TextEditingController todoItemTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// initialize device size utils class
    SizeUtil().init(context);
    return Scaffold(
      appBar: buildAppBar(context, appName),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            sizeWidth(8),
          ),
          child: ScrollConfiguration(
            behavior: RemoveScrollingGlowEffect(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(context, 0.04),
                  buildAddTodoItemTextFiled(context),
                  verticalSpace(context, 0.08),
                  buildTodoItemButtons(context),
                  verticalSpace(context, 0.03),

                  /// view demo UI screen
                  buildCustomButton(
                    context,
                    Icons.view_list,
                    viewDemoUIScreen,
                    Colors.amber.shade100,
                    Colors.amber.shade800,
                    onTap: () => Get.toNamed(demoUIScreen),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddTodoItemTextFiled(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,

      /// text field container
      child: Container(
        height: SizeUtil.screenHeight * 0.35,
        decoration: BoxDecoration(
          // color: primaryColor,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade600,
              Colors.blue.shade700,
            ],
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            verticalSpace(context, 0.03),
            Text(
              enterTodoItemTitle,
              style: titleLargeTextStyle(context).copyWith(color: Colors.white),
            ),
            verticalSpace(context, 0.02),

            /// text field for todo item
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildTextField(
                context,
                todoItemTextController,
                TextInputType.multiline,
                TextInputAction.newline,
                false,
                Colors.white,
                primaryColor,
                TextField.noMaxLength,
                typeTextHereTitle,
                true,
                onChange: (value) {},
                onSubmit: (value) {},
                minLines: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTodoItemButtons(BuildContext context) {
    return Column(
      children: [
        /// add Todo Item Button

        buildCustomButton(
          context,
          Icons.add_circle_rounded,
          addTodoItemTitle,
          Colors.indigo.shade100,
          Colors.indigo,
          onTap: () => addTodoItem(todoItemTextController.text),
        ),
        verticalSpace(context, 0.03),

        /// view all Todo Items Button
        buildCustomButton(
          context,
          Icons.view_list,
          viewAllTodoItemsTitle,
          Colors.lightBlue.shade100,
          Colors.lightBlue.shade800,
          onTap: () => goToTodoListScreen(),
        ),
      ],
    );
  }

  void addTodoItem(String todoItem) {
    /// check if todo item text is empty, if not then
    /// add todo item to the list and clear the text field

    if (todoItem.isEmpty) {
      showErrorToast(context, errorEnterTodoItemTitle);
    } else {
      homeController.addTodoItem(todoItem);
      todoItemTextController.clear();
      hideKeyboard(context);
      showSuccessToast(context, todoItemAddedSuccessfully);
    }
  }

  void goToTodoListScreen() {
    /// go to todo item list screen with the list of todo items

    Get.to(
      () => TodoListScreen(
        todoItems: homeController.todoItems,
      ),
      binding: TodoListScreenBinding(),
    );
  }
}
