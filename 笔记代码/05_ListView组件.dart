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

// 1. ListView 的 基本使用

class SFHomeContent extends StatelessWidget {
  final TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.redAccent);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("人的一切痛苦，本质上都是对自己无能的愤怒。", style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text("人活在世界上，不可以有偏差；而且多少要费点劲儿，才能把自己保持到理性的轨道上。", style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("我活在世上，无非想要明白些道理，遇见些有趣的事。", style: textStyle),
        )
      ],
    );
  }
}

// 2. ListTile 的使用 --> 常用于构建列表项,如菜单,联系人列表,等等.
class SFHomeContent1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.people,size: 36,),
          title: Text("联系人"),
          subtitle: Text("联系人的信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.people,size: 36,),
          iconColor: Colors.white, // Icon Color
          tileColor: Colors.orange, // 背景颜色
          title: Text("联系人",style: TextStyle(color: Colors.white),),
          titleTextStyle: TextStyle(fontWeight: FontWeight.w700),
          subtitle: Text("联系人的信息"),
          subtitleTextStyle: TextStyle(color: Colors.white),

          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.people,size: 36,),
          title: Text("联系人"),
          subtitle: Text("联系人的信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.people,size: 36,),
          title: Text("联系人"),
          subtitle: Text("联系人的信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}


// 3. scrollDirection 控制视图的滚动方向
class SFHomeContent2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.vertical, // 控制着滚动的方向
      itemExtent: 200, // 会根据滚动的方向 表示不同的值, 垂直方向:高; 横方向:宽;
      children: [
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
        Container(color: Colors.green),
        Container(color: Colors.purple),
        Container(color: Colors.pink),
      ]
    );
  }
}

// 4. ListView.build 适用于创建多个widget(子),性能更好,不会初始加载,而是按需加载
class SFHomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemExtent: 80,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black, width: 1),
            ),
          ),
          child: ListTile(
            title: Text("标题$index"),
            subtitle: Text("副标题$index"),
          ),
        );
      },
    );
  }
}

// 5.