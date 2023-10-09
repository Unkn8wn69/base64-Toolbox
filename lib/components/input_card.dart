import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Function(String) submit;

  const InputCard({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.submit,
  });

  @override
  Widget build(BuildContext context){
    return TextField(
      cursorColor: Colors.white,
      onSubmitted: (value) => submit(value),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.black,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500]
        )
      ),
    );
  }

}