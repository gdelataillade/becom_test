import 'package:scoped_model/scoped_model.dart';

class Contact {
  String _name;
  String _phone;
  String _email;
  String _address;
  String _zip;
  String _city;
  String _birthDate;
  String _comment;
}

class ContactsModel extends Model {
  List<Contact> _contactList = [];
}
