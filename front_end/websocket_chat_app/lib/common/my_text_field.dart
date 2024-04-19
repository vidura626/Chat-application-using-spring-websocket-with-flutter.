import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    required this.label,
    required this.controller,
    this.width,
    this.height,
    this.padding,
    this.obscureText,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final double? width;
  final double? height;
  final double? padding;
  final bool? obscureText;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 250,
      height: widget.height ?? 60,
      padding: EdgeInsets.all(widget.padding ?? 8.0),
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
          labelText: widget.label,
        ),
      ),
    );
  }
/**/
}
