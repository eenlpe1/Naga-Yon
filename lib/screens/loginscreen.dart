import 'package:flutter/material.dart';
import '../components/design_shape.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/icon.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Welcome, Guest!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                      'Enjoy a Hassle-Free Travel!',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20.0),
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
                    const SizedBox(
                      height: 20,
                    ),
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
                    const SizedBox(height: 20.0),
                    // RaisedButton(
                    //   onPressed: () {
                    //     // Add your sign-in logic here
                    //   },
                    //   color: Colors.yellow,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(5.0),
                    //   ),
                    //   child: Text(
                    //     'Sign In',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 5.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Don't have an account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            )),
                        const SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          // onTap: () => Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const Register()),
                          // ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
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
