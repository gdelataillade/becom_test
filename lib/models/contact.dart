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
  bool isPersonal;
}

class ContactModel extends Model {
  List<Contact> _contactList = [];
  List<Contact> _searchResults = [];
  int selectedContactIndex = 0;
  bool isSearching = false;

  List<Contact> get contactList => _contactList;
  List<Contact> get searchResultsList => _searchResults;

  void updateInfo(Contact newContact) {
    _contactList[selectedContactIndex] = newContact;
    notifyListeners();
  }

  void cancelUpdate() {
    notifyListeners();
  }

  void selectContact(int index) {
    selectedContactIndex = index;
    notifyListeners();
  }

  void updateSearch(String newInput) {
    _searchResults = _contactList
        .where((contact) =>
            contact.name.toLowerCase().contains(newInput.toLowerCase()))
        .toList();
    notifyListeners();
  }

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
      newContact.birthDate = "19/10/1977";
      newContact.comment = faker.lorem.sentence();
      newContact.isPersonal = faker.randomGenerator.boolean();
      _contactList.add(newContact);
    }
  }

  ContactModel() {
    _initContacts();
  }
}
