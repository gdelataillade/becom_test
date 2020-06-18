import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:becom_test/models/contact.dart';
import 'package:becom_test/widgets/item_card.dart';

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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment
              .bottomLeft, // 10% of the width, so there are ten blinds.
          colors: [
            Color.fromRGBO(44, 61, 152, 1),
            Color.fromRGBO(48, 116, 206, 1),
          ],
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.only(top: 25, left: 15, right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(10, 10, 10, 0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0.5, 0.5),
            ),
          ],
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
      height: 40,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 246, 250, 1),
        borderRadius: BorderRadius.all(const Radius.circular(30)),
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 7),
      child: ScopedModelDescendant<ContactModel>(
        builder: (context, child, model) {
          return TextField(
            onChanged: (newInput) {
              model.updateSearch(newInput);
              newInput.length > 0
                  ? model.isSearching = true
                  : model.isSearching = false;
            },
            autocorrect: false,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(Icons.search, color: Colors.grey),
              ),
              border: InputBorder.none,
            ),
          );
        },
      ),
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
        print("Build contact list");
        if (model.isSearching && model.searchResultsList.length == 0)
          return Center(child: Text("Aucun résultats"));
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
              child: Divider(color: Colors.grey),
            ),
            itemCount: model.isSearching
                ? model.searchResultsList.length
                : model.contactList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => model.selectContact(index),
                child: ItemCard(model.isSearching
                    ? model.searchResultsList[index]
                    : model.contactList[index]),
              );
            },
          ),
        );
      },
    );
  }
}
