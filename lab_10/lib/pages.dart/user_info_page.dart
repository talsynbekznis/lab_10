import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  final String fullName;
  final String email;
  final String phone;

  UserInfoPage({required this.fullName, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Профиль пользователя")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Имя: $fullName", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Email: $email", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Телефон: $phone", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}