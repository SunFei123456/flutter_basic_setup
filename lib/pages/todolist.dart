// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:study_statelesswidget/data/db.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _box = Hive.box('mybox');
  ToDoDB db = ToDoDB();

  // 创建一项待办事项  --> create
  void createTask() {
    String newTaskText = "";

    // 1. 展示dialog 让用户输入todo内容
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("创建待办事项"),
          content: TextField(
            onChanged: (value) {
              newTaskText = value; // 获取输入的待办事项内容
            },
            decoration: InputDecoration(
              hintText: "请输入待办事项",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () {
                if (newTaskText.isNotEmpty) {
                  setState(() {
                    db.todoList.add({
                      "text": newTaskText,
                      "isChecked": false,
                    });
                  });

                }
                Navigator.pop(context);
              },
              child: Text("创建"),
            ),
          ],
        );
      },
    );
  }

  // 删除一项待办事项  --> delete
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    // 更新db
    db.updateData();
  }

  // 这个重写的方法是用来初始化页面的  --> 初始化页面
  @override
  void initState() {
    super.initState();
    if (_box.get("TODOLIST") == null) {
      db.init();
    }else{
      db.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) => ToDoItem(
          todoText: db.todoList[index]["text"],
          isChecked: db.todoList[index]["isChecked"],
          onChanged: (value) {
            setState(() {
              // 更新 isChecked 的状态
              db.todoList[index]["isChecked"] = value!;
            });
            // 更新db
            db.updateData();
          },
          deleteTask: (BuildContext context) {
            deleteTask(index);
          },
        ),
      ),
    );
  }
}

// 创建一个widget 表示每一项To Do List item 事项
class ToDoItem extends StatelessWidget {
  final String todoText;
  final bool isChecked;
  final Function(bool?) onChanged;
  final Function(BuildContext) deleteTask;

  const ToDoItem({
    super.key,
    required this.todoText,
    required this.isChecked,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8))
        ]),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 235, 233, 233),
          ),
          child: CheckboxListTile(
            title: Row(
              children: [
                SizedBox(width: 8), // 图标与文本之间的间距
                Text(
                  todoText,
                  style: TextStyle(
                    fontSize: 18, // 字体大小
                    fontWeight: FontWeight.bold, // 字体加粗
                    color: isChecked ? Colors.grey : Colors.black, // 字体颜色
                    decoration: isChecked
                        ? TextDecoration.lineThrough
                        : null, // 文本是否有删除线
                  ),
                ),
              ],
            ),
            value: isChecked,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
