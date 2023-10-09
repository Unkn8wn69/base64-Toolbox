import 'package:base64_toolbox/components/input_card.dart';
import 'package:base64_toolbox/components/output_card.dart';
import 'package:base64_toolbox/components/small_outline_button.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'dart:convert';

class TextDecodePage extends StatefulWidget {
  const TextDecodePage({ Key? key}) : super(key: key);

  @override
  _TextDecodePageState createState() => _TextDecodePageState();
}

class _TextDecodePageState extends State<TextDecodePage> {
  final textController = TextEditingController();
  String output = "";

  void encode(String input){
    setState(() { 
      try {
        output = utf8.decode(base64.decode(input));
      } on Exception catch (error) {
        output = "erorr";
      }
    });
  }

  void clear(){
    setState(() {
      output = "";
    });
    textController.text = "";
  }

  void copy() {
    output.isNotEmpty ? Clipboard.setData(ClipboardData(text: output)) : DoNothingAction();
  }

  Future<void> paste() async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null) {
      String clipboardText = clipboardData.text ?? '';
      textController.text = clipboardText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: OutputCard(output: output)),
          Row(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20, left: 20),
                  child: Column( // ab column
                    children: [
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallOutlineButton(text: "Copy", icon: Icon(Icons.copy), onPressed: copy),
                            SmallOutlineButton(text: "Paste", icon: Icon(Icons.paste), onPressed: paste),
                            SmallOutlineButton(text: "Clear", icon: Icon(Icons.delete_forever), onPressed: clear),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      InputCard(
                      submit: encode,
                      controller: textController,
                      hintText: "Write something to decode",
                      obscureText: false),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    IconButton(
                      highlightColor: Theme.of(context).colorScheme.primary,
                      splashRadius: 25,
                      onPressed: () => {
                        encode(textController.text)
                      },
                      icon: Transform.rotate(angle: -3.14/2, child: const Icon(Icons.send),),
                      focusColor: Colors.grey.shade600,
                      ),
                  ],
                ),
              ),
            ],
          )
        ],
      )
        
    );
  }
}