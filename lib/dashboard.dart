// dashboard.dart
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                'assets/images/logo.png'), // Menambahkan gambar di Dashboard
            Text("Welcome to the Dashboard!"),
          ],
        ),
      ),
    );
  }
}
