import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:study_statelesswidget/pages/index.dart';
main() async {
  // 1. 初始化hive
  await Hive.initFlutter();
  // 2. 打开盒子
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: FirstPage(),
    );
  }
}

