import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("User Profile", style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: "Name")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
