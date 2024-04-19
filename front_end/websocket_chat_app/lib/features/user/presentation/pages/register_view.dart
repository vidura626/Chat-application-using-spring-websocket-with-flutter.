import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websocket_chat_app/common/my_button.dart';
import 'package:websocket_chat_app/common/my_text_field.dart';

import '../manager/register_logic.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final registerController = Get.put(RegisterLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: const BackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyTextField(label: "Name", controller: registerController.nameTEController.value),
            const SizedBox(height: 20),
            MyButton(label: "Register", onPressed: _onRegister),
          ],
        ),
      ),
    );
  }

  void _onRegister() {
    registerController.onRegister();
  }
}
