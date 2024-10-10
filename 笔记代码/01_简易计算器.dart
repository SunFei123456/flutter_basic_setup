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
        title: const Text("商品列表"),
      ),
      body: SFHomeContent("我是根widget传递的消息"),
    );
  }
}

class SFHomeContent extends StatefulWidget {
  final String message;

  const SFHomeContent(this.message, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _SFHomeContentState();
  }
}

class _SFHomeContentState extends State<SFHomeContent> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: const Text("+"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    count--;
                  });
                },
                child: const Text("-"),
              ),
            ],
          ),
          Text("当前计算的结果: $count"),
          Text("接收: ${widget.message}"),
        ],
      ),
    );
  }
}
