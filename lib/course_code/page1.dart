import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        backgroundColor: Colors.white,
        title: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Center(
            child: Text(
              "布局widget学习",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      body: SFHomeContent1(),
    );
  }
}

// 1. GridView 组件
class SFHomeContent1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // requestNetwork();
    // httpRequest();
    dioRequest();
    return Container(
      child: const Center(
          child: Text("测试",style: TextStyle(fontSize: 23))
      ),
    );
  }
}

// 1. 内置的请求方法,较繁琐
void requestNetwork() async {
  // 1.创建HttpClient对象
  final httpClient = HttpClient();

  // 2.构建请求的uri
  final uri = Uri.parse("https://www.sunfei.site/api/v1/article/category/go");

  // 3.构建请求
  final request = await httpClient.getUrl(uri);

  // 4.发送请求，必须
  final response = await request.close();
  if (response.statusCode == HttpStatus.ok) {
    print(await response.transform(utf8.decoder).join());
  } else {
    print(response.statusCode);
  }
}

// 2. 使用三方http库
void httpRequest() async{
  // 1.创建Client
  final client = http.Client();
  // 2.构建请求的url
  final url = Uri.parse("https://www.sunfei.site/api/v1/article/category/go");
  // 3.发送请求
  final response = await client.get(url);

  // 4.获取结果
  if (response.statusCode == HttpStatus.ok) {
    print(response.body);
  } else {
    print(response.statusCode);
  }
}

// 3. 较流行的现代请求库 dio
void dioRequest() async{
  // 1. 创建DIO 请求对昂
  final dio = Dio();
  // 2. 发送请求
  final res = await dio.get("https://www.sunfei.site/api/v1/article/category/go");
  // 3. 打印
  if (res.statusCode == HttpStatus.ok) {
    print(res.data);
  } else {
    print(res.statusCode);
  }
}