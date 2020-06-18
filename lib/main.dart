import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:becom_test/models/contact.dart';
import 'package:becom_test/views/contact_info.dart';
import 'package:becom_test/views/contact_list.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
