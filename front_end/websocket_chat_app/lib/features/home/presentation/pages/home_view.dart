import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket_chat_app/common/my_button.dart';
import 'package:websocket_chat_app/main.dart';

import '../manager/home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(label: "Login", onPressed: _onLogin),
              const SizedBox(width: 20),
              MyButton(label: "Register", onPressed: _onRegister),
            ],
          ),
        ));
  }

  void _onLogin() => Get.toNamed(routeMap[Routes.login]?.path ?? '/');

  void _onRegister() => Get.toNamed(routeMap[Routes.register]?.path ?? '/');
}
