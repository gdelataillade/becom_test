import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:becom_test/models/contact.dart';
import 'package:becom_test/views/contact_info.dart';
import 'package:becom_test/views/contact_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Becom test',
      home: Scaffold(
        body: ScopedModel<ContactModel>(
          model: ContactModel(),
          child: ScopedModelDescendant<ContactModel>(
            builder: (context, child, model) => Row(
              children: <Widget>[
                ContactInfo(),
                ContactList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
