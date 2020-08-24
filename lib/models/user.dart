// import '../string_util.dart';

mixin UserUtils {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1).toLowerCase();
}

enum LoginType { email, phone }

class User {
  String email;
  String phone;

  String _lastName;
  String _firstName;
  LoginType _type;

  List<User> friends = <User>[];

  User._({String firstName, String lastName, String phone, String email}) 
    : _firstName = firstName, 
    _lastName = lastName, 
    this.phone = phone, 
    this.email = email {
      print('User is created');
      _type = email != null ? LoginType.email : LoginType.phone;
    }

  factory User({String name, String phone, String email}) {
    if (name.isEmpty) {
      throw Exception('User name is empty');
    }

    if((phone == null || phone.isEmpty) && (email == null || email.isEmpty)) {
      throw Exception('Phone or email is empty');
    }

    return User._(
      firstName: _getFirstName(name),
      lastName: _getLastName(name),
      phone: checkPhone(phone),
      email: checkEmail(email),
    );
  }

  static String _getFirstName(String userName) => userName.split(' ')[0];
  static String _getLastName(String userName) => userName.split(' ')[1];

  static String checkPhone(String phone) {
    if (phone == null || phone.isEmpty) {
      return phone;
    }

    String pattern = r"^(?:[+0])?[0-9]{11}";

    phone = phone.replaceAll(RegExp("[^+\\d]"), "");

    if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception("Enter a valid phone number starting with a + and containting 11 digits");
    }

    return phone;
  }

  static String checkEmail(String email) {
    if (email == null || email.isEmpty) {
      return email;
    }

    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    if (!RegExp(pattern).hasMatch(email)) {
      throw Exception("Enter a valid email");
    }

    return email;
  }

  String get login {
    if (_type == LoginType.phone) {
      return phone;
    }

    return email;
  }

  String get name => "${"".capitalize(_firstName)} ${"".capitalize(_lastName)}";

  @override
  bool operator ==(Object object) {
    if (object == null) {
      return false;
    }

    if (object is User) {
      return _firstName == object._firstName && 
      _lastName == object._lastName && 
      (phone == object.phone || email == object.email);
    }
  }

  void addFriends(Iterable<User> newFriend) {
    friends.addAll(newFriend);
  }

  void removeFriend(User user) {
    friends.remove(user);
  }

  String get userInfo => '''
    name: $name
    email: $email
    firstName: $_firstName;
    lastName: $_lastName;
    friends: ${friends.toList()}
  ''';

  @override
  String toString() {
    return '''
    name: $name
    email: $email
    friends: ${friends.toList()}
  ''';
  }
}