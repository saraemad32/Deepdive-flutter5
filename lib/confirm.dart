import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:five/home.dart';
import 'main.dart';
class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${userProvider.name}"),
            Text("Email: ${userProvider.email}"),
            Text("Gender: ${userProvider.gender}"),
            Text("Is Student? ${userProvider.isStudent ? "Yes" : "No"}"),
            Text("Hobbies: ${userProvider.hobbies.join(", ")}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Confirm Save"),
                    content: const Text("Do you want to save the data?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Data saved successfully!")),
                          );
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }
}
