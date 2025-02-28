import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/dashboard.dart';
import 'package:first_app/help.dart';
import 'package:first_app/home.dart';
import 'package:first_app/loading_screen.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kicau Mania',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/dashboard': (context) => Dashboard(),
        '/help': (context) => Help(),
      },
    );
  }
}
