import 'package:flutter/material.dart';
class TextInputWidget extends StatefulWidget {

  final Function(String) callback;
  TextInputWidget(this.callback);


  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  void click(){
    //FocusScope.of(context).unfocus(); // This makes the keyboard hide on mobile
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: this.controller,
      onEditingComplete: this.click,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.message),
        labelText: "Type a Message:",
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          splashColor: Colors.blue,
          tooltip: "Post Message",
          onPressed: this.click,
          
      )));
  }
}
