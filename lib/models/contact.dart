import 'package:scoped_model/scoped_model.dart';
import 'package:faker/faker.dart';

class Contact {
  String name;
  String phone;
  String email;
  String address;
  String zip;
  String city;
  String birthDate;
  String comment;
}

class ContactModel extends Model {
  List<Contact> _contactList = [];

  void _initContacts() {
    Faker faker = Faker();
    int contactsNb = 50;

    for (var i = 0; i < contactsNb; i++) {
      Contact newContact = Contact();

      newContact.name = faker.person.name();
      newContact.phone = "06 65 65 65 65";
      newContact.email = faker.internet.email();
      newContact.address = faker.address.streetAddress();
      newContact.zip = faker.address.zipCode();
      newContact.city = faker.address.city();
      newContact.birthDate = faker.date.time();
      newContact.comment = faker.lorem.sentence();
      _contactList.add(newContact);
    }
  }

  ContactModel() {
    _initContacts();
  }
}
