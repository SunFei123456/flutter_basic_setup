/* import 'package:flutter/material.dart';
import 'package:study_statelesswidget/pages/detail_page.dart';
import './pages/home_page.dart'; // 导入HomePage
import './pages/business_page.dart'; // 导入BusinessPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0; // 当前选中的底部导航栏索引
  final pages = [HomePage(), BusinessPage(), BusinessPage()]; // 定义各个页面

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Flutter demo'),
            backgroundColor: Colors.white), // 头部bar
        drawer: Drawer(
          backgroundColor: Colors.deepPurple[100],
          child: Column(
            children: [
              const DrawerHeader(
                child: Icon(
                  Icons.library_music,
                  size: 62,
                ),
              ),
              const ListTile(
                leading: Icon(Icons.home),
                title: Text("我的"),
              ),
              const ListTile(
                leading: Icon(Icons.music_note),
                title: Text("音乐"),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("设置"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/game");
                },
              ),
              Builder(
                // 使用 Builder 来获取 Scaffold 上下文
                builder: (context) {
                  return ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("详情"),
                    onTap: () {
                      Navigator.pop(context); // 先关闭 Drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailPage()),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: currentIndex, // 通过索引来展示当前选中的页面
          children: pages,
        ), // 中间内容
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(), // 凹槽样式
          notchMargin: 5.0, // 凹槽边距
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6), // BottomAppBar内边距
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    changeCurrentIndex(0); // 切换到首页
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.home, color: getColor(0)), // 首页图标
                      Text('首页', style: TextStyle(color: getColor(0))),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 80), // 中间空隙，为FloatingActionButton留出位置
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    changeCurrentIndex(1); // 切换到Business页面
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.medical_information_rounded,
                          color: getColor(1)),
                      Text('游戏', style: TextStyle(color: getColor(1)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ), // 底部bar
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          onPressed: () {
            // 中间的按钮点击事件
          },
          child: const Icon(Icons.add, size: 36),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .centerDocked, // 设置FloatingActionButton的位置为底部中间
      ),
      routes: {'/detail': (context) => const DetailPage(), '/game': (context) =>  BusinessPage()},
    );
  }

  // 获取颜色，根据当前选中索引来改变图标和文本的颜色
  Color getColor(int value) {
    return currentIndex == value
        ? Theme.of(context).primaryColor
        : const Color(0xff999999);
  }

  // 更改当前索引并刷新页面
  void changeCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
 */