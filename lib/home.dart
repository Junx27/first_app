import 'package:first_app/login.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isChecked = false;
  bool _isLoading = false;
  void _navigateToLogin() {
    setState(() {
      _isChecked = false;
      _isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Login();
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 500,
                          height: 320,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          top: 220,
                          child: Text(
                            "KICAU MANIA",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 255,
                          child: Text(
                            "INDONESIA",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 300,
                          child: Text(
                            "\"Menyatukan Bersama Hobi\"",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                          activeColor: Colors.red,
                          checkColor: Colors.white,
                          side: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Saya telah membaca dan menyetujui Kebijakan Privasi dan Ketentuan Penggunaan aplikasi ini.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _isChecked ? _navigateToLogin : null,
                      child: _isLoading
                          ? Text(
                              'Sedang memuat data',
                              style: TextStyle(color: Colors.white),
                            )
                          : Text(
                              'Bergabung Sekarang',
                              style: TextStyle(color: Colors.white),
                            ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 250.0),
                      child: Text(
                        "Copyright © Directed by Junx SF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _isLoading
              ? Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
