import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket_chat_app/common/my_button.dart';
import 'package:websocket_chat_app/common/my_text_field.dart';

import '../manager/login_logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final loginController = Get.put(LoginLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            MyTextField(label: "Name", controller: loginController.nameTEController.value),
            const SizedBox(height: 20),
            MyButton(label: "Log", onPressed: _onLoginBtn)
          ],
        ),
      ),
    );
  }

  void _onLoginBtn() {
    loginController.login();
  }
}
