import 'package:flutter_todo_app/custom_imports.dart';

/// this file contains TodoListScreen specific components

Widget buildTodoItem(
  BuildContext context,
  String todoItemText, {
  required Function onDelete,
}) {
  return Card(
    color: Colors.indigo.shade50,
    shadowColor: cardShadowColor,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: EdgeInsets.all(
        sizeWidth(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// text of the todo item
          Expanded(
            child: ScrollConfiguration(
              behavior: RemoveScrollingGlowEffect(),
              child: SingleChildScrollView(
                child: Text(
                  todoItemText,
                  style: bodyMediumTextStyle(context),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          verticalSpace(context, 0.02),

          /// bottom view row
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),

                  /// created todo time (I've set is dummy for UI purpose only)
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(
                        sizeWidth(6),
                      ),
                      child: Text(
                        dummyTimeText,
                        style: bodySmallTextStyle(context).copyWith(
                            color: Colors.indigo.shade700,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpace(context, 0.02),

              /// delete todo item button
              InkWell(
                highlightColor: Colors.red.shade100,
                splashColor: Colors.red.shade400,
                hoverColor: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onTap: () => onDelete(),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
