import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:becom_test/models/contact.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.35,
      color: Colors.blue,
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _SearchBar(),
            _ItemsList(),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  @override
  __SearchBarState createState() => __SearchBarState();
}

class __SearchBarState extends State<_SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.grey,
      height: 50,
      width: MediaQuery.of(context).size.width * 0.3,
    );
  }
}

class _ItemsList extends StatefulWidget {
  @override
  __ItemsListState createState() => __ItemsListState();
}

class __ItemsListState extends State<_ItemsList> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ContactModel>(
      builder: (context, child, model) {
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(color: Colors.grey),
            itemCount: model.contactList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => model.selectContact(index),
                child: _ItemCard(model.contactList[index]),
              );
            },
          ),
        );
      },
    );
  }
}

class _ItemCard extends StatefulWidget {
  final Contact contact;

  const _ItemCard(this.contact);

  @override
  __ItemCardState createState() => __ItemCardState();
}

class __ItemCardState extends State<_ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.contact.name),
          Text(widget.contact.phone),
        ],
      ),
    );
  }
}
