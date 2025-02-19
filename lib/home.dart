import 'package:flutter/material.dart';
import 'dashboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  // Menggunakan Stack
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 500,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      top: 210,
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
                  ],
                ),
                SizedBox(height: 20),
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
                  onPressed: _isChecked
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()),
                          );
                        }
                      : null,
                  child: Text(
                    'Bergabung Sekarang',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
                // Copyright
                Padding(
                  padding: const EdgeInsets.only(top: 20.0), // Margin top
                  child: Text(
                    "Copyright © Directed by Junx",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center, // Rata tengah
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
