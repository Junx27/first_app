import 'package:flutter/material.dart';

class LoginWithEmail extends StatefulWidget {
  @override
  _LoginWithEmailState createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      String email = _emailController.text;
      String password = _passwordController.text;

      // Simulate login check with hardcoded credentials
      if (email != "example@email.com" || password != "12345678") {
        // If credentials are incorrect, show a custom BottomSheet
        _showErrorBottomSheet(context);
      } else {
        // Simulate network delay
        Navigator.pushReplacementNamed(context, '/dashboard');
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  // Function to show custom BottomSheet error
  void _showErrorBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // This allows you to control the height of the BottomSheet
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 400, // Full width
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/warning.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              Text(
                'Gagal!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Akun tidak ditemukan',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 80,
                width: 350,
                child: Text(
                  'Akun tidak ditemukan, pastikan akun terdaftar pada aplikasi. Perhatikan juga email dan password!',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 40,
                width: 150, // 80% of screen width
                child: ElevatedButton(
                  onPressed: () {
                    // Close the BottomSheet and reset the form
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text(
                    'Tutup',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.deepOrange,
          padding: EdgeInsets.only(left: 25),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, bottom: 20),
                    child: Image.asset(
                      'assets/icons/logo.png',
                      width: 100,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Masukan email',
                            labelStyle: TextStyle(
                                fontSize: 13, color: Colors.deepOrange),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.email,
                                color: Colors.deepOrange,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2,
                                )),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15)),
                        style: TextStyle(fontSize: 13),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9._%+-]+@[a-zA0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Masukan password',
                            labelStyle: TextStyle(
                                fontSize: 13, color: Colors.deepOrange),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.lock,
                                color: Colors.deepOrange,
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.deepOrange,
                                  width: 2,
                                )),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15)),
                        style: TextStyle(fontSize: 13),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => _login(context), // Handle login
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: _isLoading
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              : Text(
                                  'Masuk',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
