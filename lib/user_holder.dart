import 'models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception("A user with this name already exist");
    }
  }

  User registerUserByPhone(String name, String phone) {
    User user = User(name: name, phone: phone);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception("A user with this name already exist");
    }

    return user;
  }

  User registerUserByEmail(String name, String email) {
    User user = User(name: name, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception("A user with this name already exist");
    }

    return user;
  }

  User getUserByLogin(String login) {
    if (!users.containsKey(login)) {
      throw Exception("There is no user with this name");
    } else {
      return users[login];
    }
  }

  void setFriends(String userLogin, List<User> friends) {
    User user = this.getUserByLogin(userLogin);

    user.addFriends(friends);
  }

  User findUserInFriends(String userLogin, User friend) {
    User user = this.getUserByLogin(userLogin);

    User result = user.friends.firstWhere((user) => user.name == friend.name, orElse: () => null);

    if(result == null) {
      throw Exception("User not found");
    }

    return result;
  }

  List<User> importUsers(List<String> data) {
    List<String> arr = data[0].split(';');

    String name = arr[0].trim();
    String email = arr[1].trim();
    String phone = arr[2].trim();

    User user = User(name: name, phone: phone, email: email);

    return [user];
  }
}