import 'package:finalproject/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/design_shape.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> sendData() async {
    final response = await http.post(
      Uri.parse('http://zz.ncf.edu.ph/public/api/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'first_name': firstName.text,
        'last_name': lastName.text,
        'phone_number': phoneNumber.text,
        'email': email.text,
        'password': password.text,
      }),
    );

    if (response.statusCode == 200) {
      // Data sent successfully
      final snackBar = SnackBar(
        content: const Text('Your account has been successfully created'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Login',
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      // Error sending data
      const snackBar = SnackBar(
        content: Text('Account already exists'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.fixed,
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: CurveShape(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Card(
              margin: const EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: const Color(0xFFffffff),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Want to Travel with Us?",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: Icon(Icons.person,
                              color: Colors.grey, size: 20.0),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0)),
                      // controller: email,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(Icons.person,
                              color: Colors.grey, size: 20.0),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0)),
                      // controller: email,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon:
                              Icon(Icons.phone, color: Colors.grey, size: 20.0),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0)),
                      // controller: email,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon:
                              Icon(Icons.email, color: Colors.grey, size: 20.0),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0)),
                      // controller: email,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon:
                              Icon(Icons.lock, color: Colors.grey, size: 22.0),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0)),
                      // controller: password,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        sendData();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an Account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                            )),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          ),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              color: Color(0xFFfdc500),
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
