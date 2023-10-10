import 'package:flutter/material.dart';

class SmallOutlineButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function() onPressed;

  const SmallOutlineButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context){
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white, side: const BorderSide(color: Colors.white)
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 5,),
          Text(text),
        ],
      ),
    );
  }

}