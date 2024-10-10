import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SFHomePage(), // 去掉 const
    );
  }
}

class SFHomePage extends StatelessWidget {
  const SFHomePage({super.key}); // 添加 const 修饰符

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Center(
            child: Text(
              "图像Widget学习",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      body: SFHomeContent(),
    );
  }
}

class SFHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 18),
        ElevatedButton(
          onPressed: () {
            // 按钮被点击时执行的操作
            print('按钮按下了');
          },
          child: Text('点击'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // 按钮背景颜色
            foregroundColor: Colors.white, // 按钮文本颜色
            shape: RoundedRectangleBorder(
              // 圆角矩形边框
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // 内边距
          ),
        ),
        SizedBox(height: 18),
        TextButton(

          onPressed: () {},
          child: Text('取消'),
        ),
        OutlinedButton(
          onPressed: null, // 按钮禁用
          child: Text('Outlined Button'),
        ),
        SizedBox(height: 18),
        // Icon + 文本
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.thumb_up), // 按钮前的图标
          label: Text('点赞'),        // 按钮文本
        ),
        SizedBox(height: 18),
        // 只显示ICON
        IconButton(
          icon: Icon(Icons.favorite),   // 图标
          color: Colors.red,            // 图标颜色
          onPressed: () {
            print('IconButton Pressed');
          },
        ),
        SizedBox(height: 18),
        FloatingActionButton(
          onPressed: () {  },
          child: Text("按钮"),
        ),
        SizedBox(height: 18),
        FloatingActionButton(
          onPressed: () {  },
          child: Text("按钮"),
        ),
        SizedBox(height: 18),

      ],

    );
  }
}
