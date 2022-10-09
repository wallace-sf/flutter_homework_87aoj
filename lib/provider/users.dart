import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';
import 'package:flutter_homework_87aoj/data/dummy_users.dart';
import 'package:flutter_homework_87aoj/models/user.dart';

class UsersProvider with ChangeNotifier {
  final Map<String, User> _items = {...dummyUsers};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (_items.containsKey(user.id)) {
      _items.update(
          user.id.toString(),
          (_) => User(
                id: user.id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    } else {
      _items.putIfAbsent(
          user.id ?? const Uuid().v4(),
          () => User(
                id: user.id,
                name: user.name,
                email: user.email,
                avatarUrl: user.avatarUrl,
              ));
    }

    notifyListeners();
  }

  void remove(User user) {
    if (user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
