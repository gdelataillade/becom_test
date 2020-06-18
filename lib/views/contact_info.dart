import 'package:becom_test/widgets/button.dart';
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
      child: Column(
        children: <Widget>[
          _Header(),
          _ContactType(),
          _Form(),
        ],
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
    return Container(
      padding: const EdgeInsets.only(left: 100, top: 20),
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.person, color: Colors.blue),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.business, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  Contact _contact;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(const Radius.circular(15)),
        ),
        child: ScopedModelDescendant<ContactModel>(
          builder: (context, child, model) {
            _contact = model.contactList[model.selectedContactIndex];
            print(model.selectedContactIndex);
            print(_contact.name);
            return Column(
              children: <Widget>[
                FormInput("Nom", _contact.name),
                Row(
                  children: <Widget>[
                    Expanded(child: FormInput("Téléphone", _contact.phone)),
                    Expanded(child: FormInput("Email", _contact.email)),
                  ],
                ),
                FormInput("Adresse de facturation", _contact.address),
                Row(
                  children: <Widget>[
                    Expanded(child: FormInput("Code postal", _contact.zip)),
                    Expanded(child: FormInput("Ville", _contact.city)),
                  ],
                ),
                FormInput("Date de naissance", _contact.birthDate),
                FormInput("Commentaire", _contact.comment),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Button("Annuler", Colors.red, () {}),
                    Button("Valider", Colors.green, () {}),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class FormInput extends StatefulWidget {
  final String label;
  final String value;

  const FormInput(this.label, this.value);

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  TextEditingController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController(text: widget.value);
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
