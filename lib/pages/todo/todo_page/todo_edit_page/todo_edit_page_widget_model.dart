import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoEditPageWidgetModel extends ChangeNotifier {


  void todoSave(BuildContext context, String value,int todoIndex) async {
    if (value == '') return;
    var todoBox = await Hive.openBox<String>('box_for_todo');
    await todoBox.putAt(todoIndex, value);
  }

  void onSubmitted(String text,int todoIndex) async {
    if (text == '') return;
    var todoBox = await Hive.openBox<String>('box_for_todo');
    await todoBox.putAt(todoIndex, text);
  }

}

class TodoEditPageWidgetModelProvider extends InheritedNotifier {
  final TodoEditPageWidgetModel model;

  const TodoEditPageWidgetModelProvider({
    Key? key,
    required Widget child,
    required this.model,
  }) : super(
    key: key,
    notifier: model,
    child: child,
  );

  static TodoEditPageWidgetModelProvider of(BuildContext context) {
    final TodoEditPageWidgetModelProvider? result =
    context.dependOnInheritedWidgetOfExactType<TodoEditPageWidgetModelProvider>();
    assert(result != null, 'No TodoWidgetModelProvider found in context');
    return result!;
  }
}
