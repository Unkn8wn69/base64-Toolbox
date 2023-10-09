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
      child: Row(
        children: [
          icon,
          SizedBox(width: 5,),
          Text(text),
        ],
      ),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        side: BorderSide(color: Colors.white)
      ),
    );
  }

}