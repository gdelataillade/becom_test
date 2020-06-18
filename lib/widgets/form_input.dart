import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  final String label;
  final String value;
  final Function(String) callback;

  const FormInput(this.label, this.value, this.callback);

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  TextEditingController _controller;

  void _initController() {
    _controller = TextEditingController(text: widget.value);
    _controller.addListener(() => widget.callback(_controller.text));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initController();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: _controller,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
        ),
      ),
    );
  }
}
