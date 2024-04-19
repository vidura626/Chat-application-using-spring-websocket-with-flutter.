import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  const MyButton({
    required this.label,
    required this.onPressed,
    this.focusNode,
    this.alignment,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final FocusNode? focusNode;
  final Alignment? alignment;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      focusNode: focusNode,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        shape: LinearBorder.none,
        elevation: 5,
        alignment: alignment,
      ),
      child: Text(label),
    );
  }
}
