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
          return Column(
            children: <Widget>[
              _Header(),
              _ContactType(),
              _Form(),
            ],
          );
        },
      ),
    );
  }
}

class _Header extends StatefulWidget {
  @override
  __HeaderState createState() => __HeaderState();
}

class __HeaderState extends State<_Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.65,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 80, top: 28),
        child: Text(
          "Infos",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class _ContactType extends StatefulWidget {
  @override
  __ContactTypeState createState() => __ContactTypeState();
}

class __ContactTypeState extends State<_ContactType> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
