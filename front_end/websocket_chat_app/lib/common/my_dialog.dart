import 'package:flutter/material.dart';
import 'package:websocket_chat_app/common/my_button.dart';

class MyDialog extends StatelessWidget {

  String title;
  String message;

  MyDialog({
    required this.title,
    required this.message,
    super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        padding: const EdgeInsets.all(10),
        child: Text(title),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message)
        ],
      ),
      actions: [
        MyButton(label: "Ok", onPressed: (){
          Navigator.pop(context);
        }),
      ],
    );
  }
}
