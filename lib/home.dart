import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        body: Container(
          height: 500,
          child: Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(userProvider.name),
                  subtitle: Text(userProvider.email),
                ),
                ListTile(
                  leading: Icon(Icons.boy),
                  title: Text("Gender"),
                  subtitle: Text(userProvider.gender),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Is Student"),
                  subtitle: Text("${userProvider.isStudent}"),
                ),
                ListTile(
                  leading: Icon(Icons.sports_basketball_outlined),
                  title: Text("Hobby : Football"),
                  subtitle: Text("${userProvider.ishobby}"),
                ),
                ListTile(
                  leading: Icon(Icons.menu_book_sharp),
                  title: Text("Hobby : Reading"),
                  subtitle: Text("${userProvider.ishobby}"),
                ),
                ListTile(
                  leading: Icon(Icons.airplanemode_active),
                  title: Text("Hobby : Travel"),
                  subtitle: Text("${userProvider.ishobby}"),
                )
              ],
            ),
          ),
        )
    );
  }
}