import 'package:flutter/material.dart';
import 'package:flutter_homework_87aoj/provider/users.dart';
import 'package:flutter_homework_87aoj/widgets/user_tile.dart';
// import 'package:flutter_homework_87aoj/models/user.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FIAP Filmes'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              users.remove(users.byIndex(3));
              // users.put(const User(
              //     name: '500', email: 'Teste2@teste.com.br', avatarUrl: ''));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => UserTile(user: users.byIndex(i)),
        itemCount: users.count,
      ),
    );
  }
}
