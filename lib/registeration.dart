import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:five/confirm.dart';
import 'main.dart';
class RegistrationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Registration")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
                onChanged: userProvider.setName,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                onChanged: userProvider.setEmail,
              ),
              const SizedBox(height: 10),
              const Text("Gender:"),
              RadioListTile(
                title: const Text("Male"),
                value: "Male",
                groupValue: userProvider.gender,
                onChanged: (val) => userProvider.setGender(val!),
              ),
              RadioListTile(
                title: const Text("Female"),
                value: "Female",
                groupValue: userProvider.gender,
                onChanged: (val) => userProvider.setGender(val!),
              ),
              SwitchListTile(
                title: const Text("Subscribe to Newsletter"),
                value: userProvider.isStudent,
                onChanged: userProvider.setIsStudent,
              ),
              const Text("Hobbies:"),
              CheckboxListTile(
                title: const Text("Football"),
                value: userProvider.hobbies.contains("Football"),
                onChanged: (val) =>
                    userProvider.toggleHobby("Football", val!),
              ),
              CheckboxListTile(
                title: const Text("Reading"),
                value: userProvider.hobbies.contains("Reading"),
                onChanged: (val) =>
                    userProvider.toggleHobby("Reading", val!),

              ),
              CheckboxListTile(
                title: const Text("Travel"),
                value: userProvider.hobbies.contains("Travel"),
                onChanged: (val) =>
                    userProvider.toggleHobby("Travel", val!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfirmationPage()),
                  );
                },
                child: const Text("Next"),
              )
            ],
          ),
        ),
      ),
    );
  }
}