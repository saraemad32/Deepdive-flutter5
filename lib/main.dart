import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:five/registeration.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}

class UserProvider extends ChangeNotifier {
  String name = "";
  String email = "";
  String gender = "Male";
  bool isStudent = false;
  bool? ishobby =false;
  List<String> hobbies = [];

  void setName(String val) {
    name = val;
    notifyListeners();
  }

  void setEmail(String val) {
    email = val;
    notifyListeners();
  }

  void setGender(String val) {
    gender = val;
    notifyListeners();
  }

  void setIsStudent(bool val) {
    isStudent = val;
    notifyListeners();
  }

  void toggleHobby(String hobby, bool value) {
    if (value) {
      hobbies.add(hobby);
      ishobby=value;
    } else {
      hobbies.remove(hobby);
      ishobby=!value;
    }
    notifyListeners();
  }
}




