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
              "文本测试",
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
    return const Column(
      children: [
        // 1. 基础展示,文本样式
        Text(
          "你好啊,初次认识,多多款待",
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
        // 2, 文本溢出 展示省略号
        Text(
          "测试多行文本截断,限制在3行之内,测试,测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试131",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          maxLines: 3, // 展示3行,超过3行之后进行截断
          overflow: TextOverflow.ellipsis, // 超出的部分展示... , 搭配maxLines 使用
        ),
        // 3. 富文本展示
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "此时",
                  style: TextStyle(fontSize: 22,color: Colors.amber)
              ),
              TextSpan(
                  text: "此刻",
                  style: TextStyle(fontSize: 32,color: Colors.orange)
              )
            ]
          )
        ),
      ],
    );
  }
}
