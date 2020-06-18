import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final Color color;
  final Function() callback;

  const Button(this.text, this.color, this.callback);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: widget.callback,
        color: widget.color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Container(
          width: 110,
          height: 50,
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
