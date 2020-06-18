import 'package:flutter/material.dart';
import 'package:becom_test/models/contact.dart';

class ItemCard extends StatefulWidget {
  final Contact contact;

  const ItemCard(this.contact);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(left: 20),
      child: Row(
        children: <Widget>[
          Icon(widget.contact.isPersonal ? Icons.person : Icons.business),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.contact.name,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 5),
              Text(widget.contact.phone),
            ],
          ),
        ],
      ),
    );
  }
}
