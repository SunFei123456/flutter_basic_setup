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
              style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700),
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
    return Column(
      //1. 本地加载 or url 请求加载
      children: [
        Container(
          width: double.infinity,
          height: 200,
          child: Image.network(
            'https://images.pexels.com/photos/28795119/pexels-photo-28795119.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 18),
        // 2. 图片占位
        Container(
          width: double.infinity,
          height: 200,
          child: FadeInImage.assetNetwork(
            // 图片加载时显示的占位图
            placeholder:
                'https://images.pexels.com/photos/28795927/pexels-photo-28795927.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            // 图片加载回来显示加载回来的图片
            image:
                'https://images.pexels.com/photos/3538721/pexels-photo-3538721.jpeg?auto=compress&cs=tinysrgb&w=400',

            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 18),
        // 3. 图片裁剪
        Container(
            width: 300,
            height: 300,
            child: ClipOval(
              child: Image.network(
                'https://images.pexels.com/photos/28795121/pexels-photo-28795121.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                fit: BoxFit.fill,
              ),
            )),
        // 添加更多图片
      ],
    );
  }
}
