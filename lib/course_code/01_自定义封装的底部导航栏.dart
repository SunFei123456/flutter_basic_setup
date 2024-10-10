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
      // 封装后的 Drawer
      drawer: _buildDrawer(context),
      bottomNavigationBar: _buildBottomAppBar(context),
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
          // 使用封装的 ListTile
          _buildListTile(
            title: '首页',
            subtitle: '跳转到首页',
            icon: Icons.home,
            onTap: () {
              Navigator.of(context).pop(); // 关闭 Drawer
              changeIndex(0); // 切换到首页
            },
          ),
          _buildListTile(
            title: '收藏',
            subtitle: '跳转到收藏页',
            icon: Icons.favorite,
            onTap: () {
              Navigator.of(context).pop(); // 关闭 Drawer
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
      onTap: onTap, // 点击事件
    );
  }

  // 封装 BottomAppBar
  Widget _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(), // 凹槽样式
      notchMargin: 5.0, // 凹槽边距
      padding: const EdgeInsets.fromLTRB(0, 6, 0, 6), // BottomAppBar内边距
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconWithText(
            icon: Icons.home,
            label: '首页',
            onPressed: () {
              changeIndex(0); // 切换到首页
            },
          ),
          _buildIconWithText(
            icon: Icons.search,
            label: '搜索',
            onPressed: () {
              changeIndex(1); // 切换到搜索
            },
          ),
          _buildIconWithText(
            icon: Icons.add,
            label: '添加',
            onPressed: () {
              changeIndex(2); // 切换到添加
            },
          ),
          _buildIconWithText(
            icon: Icons.favorite,
            label: '收藏',
            onPressed: () {
              changeIndex(3); // 切换到收藏
            },
          ),
        ],
      ),
    );
  }

  // 封装图标与文字组合
  Widget _buildIconWithText({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.purple,
          ),
          const SizedBox(height: 4.0), // 图标与文字之间的间距
          Text(
            label,
            style: const TextStyle(fontSize: 12.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
