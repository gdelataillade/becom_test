import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:becom_test/models/contact.dart';

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.65,
      color: Colors.red,
      child: ScopedModelDescendant<ContactModel>(
        builder: (context, child, model) {
          return Center(
            child: Text(
              model.contactList[model.selectedContactIndex].name,
            ),
          );
        },
      ),
    );
  }
}
