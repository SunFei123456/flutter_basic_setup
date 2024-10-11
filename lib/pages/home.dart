// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  String userInputContent = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "用户名",
                  ),
                  onChanged: (value) => setState(() {
                    userInputContent = value;
                  }),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            userInputContent = controller.text;
                          });
                        },
                        child: Text("打印用户输入的内容")),
                    SizedBox(width: 20),
                    Text(
                      userInputContent,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                )
              ],
            )));
  }
}
