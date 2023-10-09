import 'package:flutter/material.dart';

class OutputCard extends StatefulWidget {
  final String output;
  const OutputCard({ required this.output, Key? key}) : super(key: key);

  @override
  _OutputCardState createState() => _OutputCardState();

}

class _OutputCardState extends State<OutputCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: 25, left: 20, right:20),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 5),
        child: SingleChildScrollView(
          child: SelectableText(
            widget.output,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15),
            )
          ),
      ),
    );
  }

}