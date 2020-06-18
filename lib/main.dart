import 'package:becom_test/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Becom test',
      home: Scaffold(
        body: ScopedModel<ContactsModel>(
          model: ContactsModel(),
          child: ScopedModelDescendant<ContactsModel>(
            builder: (context, child, model) => Container(),
          ),
        ),
      ),
    );
  }
}
