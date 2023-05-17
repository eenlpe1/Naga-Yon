import 'package:flutter/material.dart';

// import '../screens/loginscreen.dart';
import '../screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      title: "Naga'Yon",
      home: const HomeScreen(),
    );
  }
}
