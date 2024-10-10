import 'package:flutter/material.dart';
import 'package:study_statelesswidget/pages/add.dart';
import 'package:study_statelesswidget/pages/collect.dart';
import 'package:study_statelesswidget/pages/home_page.dart';
import 'package:study_statelesswidget/pages/search.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // 当前选中的导航栏索引
  int _currentIndex = 0;

  // 更改当前选中的导航栏索引
  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pageList = <Widget>[
    const HomePage(), // 首页
    const SearchPage(), // 搜索
    const AddPage(), // 添加
    const CollectPage(), // 收藏
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Demo Study",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.purple[200],
      ),
      body: _pageList[_currentIndex], // 根据索引切换页面
      drawer: _buildDrawer(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // 封装 Drawer
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple[200],
            ),
            child: const Text(
              '我的导航栏',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          _buildListTile(
            title: '首页',
            subtitle: '跳转到首页',
            icon: Icons.home,
            onTap: () {
              Navigator.of(context).pop();
              changeIndex(0); // 切换到首页
            },
          ),
          _buildListTile(
            title: '收藏',
            subtitle: '跳转到收藏页',
            icon: Icons.favorite,
            onTap: () {
              Navigator.of(context).pop();
              changeIndex(3); // 切换到收藏页
            },
          ),
        ],
      ),
    );
  }

  // 封装 ListTile
  Widget _buildListTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  // 使用 BottomNavigationBar 替换自定义的 BottomAppBar
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex, // 当前选中的索引
      selectedItemColor: Colors.purple, // 选中的颜色
      unselectedItemColor: Colors.grey, // 未选中的颜色
      onTap: (int index) {
        changeIndex(index); // 点击后改变页面
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '首页',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '搜索',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '添加',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '收藏',
        ),
      ],
    );
  }
}
