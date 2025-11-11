import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  ProfilePage({required this.username});

  final Color lightCoral = Color(0xFFF08080);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightCoral,
        title: Text("Profil"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/profile.png"),
            ),
            SizedBox(height: 20),
            Text(username, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("ID: 123670053"),
            Text("$username.id"),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: lightCoral),
              onPressed: () => Navigator.pop(context),
              child: Text("Kembali"),
            )
          ],
        ),
      ),
    );
  }
}
