import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket_chat_app/features/user/presentation/pages/login_view.dart';
import 'package:websocket_chat_app/features/user/presentation/pages/register_view.dart';

import 'features/home/presentation/pages/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo for websocket and clean architecture',
      initialRoute: '/',
      getPages: _getPages(),
    );
  }

  _getPages() {
    return routeMap.entries
        .map((e) => GetPage(
              name: e.value.path,
              page: () => e.value.page,
            ))
        .toList();
  }
}

Map<Routes, MyRoute> routeMap = {
  Routes.home: MyRoute('/', HomePage()),
  Routes.register: MyRoute('/register', RegisterPage()),
  Routes.login: MyRoute('/login', LoginPage()),
};

enum Routes { home, register, login }

class MyRoute {
  String path;
  Widget page;

  MyRoute(this.path, this.page);
}
