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
              "布局widget学习",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      body: SFHomeContent3(),
    );
  }
}

// 1. Align 用于将子元素相对父元素的一种布局方式
/*class SFHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Align(
      alignment: Alignment.bottomLeft,
      child:Icon(Icons.access_alarms_outlined,size: 36,color: Colors.black) ,
      widthFactor: 2,
      heightFactor: 2,
    );
  }
}*/

// 2. Center 组件 继承自Align 组件, 等效于于 把Align 的 alignment 设置为 Alignment.center
class SFHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Icon(Icons.access_alarms_outlined, size: 36, color: Colors.black),
      widthFactor: 2,
      heightFactor: 2,
    );
  }
}

// 3. Padding 组件, 设置内边距,也可以充当外边距使用的

class SFHomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text("这是一段很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的文本"),
    );
  }
}

// 4. Container 组件
class SFHomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 200,
        padding: EdgeInsets.all(16),
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(20), // 每个角
          borderRadius: BorderRadius.only(topLeft: Radius.circular(120)), // 单个角
          color: Colors.orange, // 背景颜色
          // 阴影
          boxShadow: [
            BoxShadow(
                offset: Offset(-1, 5), // 偏移x,y
                color: Colors.black, // 阴影颜色
                blurRadius: 5)
          ],
          // 渐变
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
            child: Text("测试文本"),
        ),
      ),
    );
  }
}


// 5. Flex widget 组件
class SFHomeContent3 extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Flex(
       // direction:Axis.horizontal, // row 横向
       direction: Axis.vertical, // column 纵向
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Container(
           width: 50,
           height: 50,
           color: Colors.amber,
         ),
         const Spacer(flex: 1),
         Container(
           width: 80,
           height: 80,
           color: Colors.blue,
         ),
         const Spacer(flex: 1),
         Container(
           width: 100,
           height: 100,
           color: Colors.green,
         )
       ],
     );
  }
}