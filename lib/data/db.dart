
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDB {
  final _myBox = Hive.box('mybox');
  List todoList = [];
  // 当第一次启动这个app的时候，这个方法会被调用
  void init() {
    todoList = [
      { "text": "学习", "isChecked": false},
      { "text": "睡觉", "isChecked": false},
      { "text": "打豆豆", "isChecked": true},
    ];
  }

  // 读取数据
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  // 更新数据
  void updateData() {
    _myBox.put("TODOLIST", todoList);
  }
}
