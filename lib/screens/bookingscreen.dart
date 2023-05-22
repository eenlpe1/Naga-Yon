import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'loginscreen.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key, required this.destination}) : super(key: key);

  final String destination;

  @override
  // ignore: library_private_types_in_public_api
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  late TextEditingController destinationplan;
  String? selectedTransportation;
  TimeOfDay? selectedTime;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    destinationplan = TextEditingController(text: widget.destination);
  }

  @override
  void dispose() {
    destinationplan.dispose();
    super.dispose();
  }

  Future<void> sendData() async {
    final response = await http.post(
      Uri.parse(
          'https://ncfnagayon-api.000webhostapp.com/api/nagayon/bookings/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'first_name': firstName.text,
        'last_name': lastName.text,
        'phone_number': phoneNumber.text,
        'email': email.text,
        'destination': destinationplan.text,
        'transportation': selectedTransportation,
        'time': selectedTime != null ? selectedTime!.format(context) : '',
        'date': selectedDate != null
            ? selectedDate!.toIso8601String().split('T')[0]
            : '',
      }),
    );

    if (response.statusCode == 200) {
      // Data sent successfully
      final snackBar = SnackBar(
        content: const Text('Your booking was created successfully'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Login',
          textColor: Colors.green,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      // Error sending data
      const snackBar = SnackBar(
        content: Text('Something went wrong. Please try again!'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.fixed,
        duration: Duration(seconds: 2),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<String> transportationOptions = [
    '-- Air Transportation --',
    'AirAsia Zest',
    'Cebu Pacific',
    'Cebgo',
    'PAL Express',
    'Skyjet',
    '-- Land Transportation --',
    'Bicol Isarog Trans',
    'Cagsawa Travel and Tours',
    'Penafrancia Bus',
    'Philtranco',
    'Raymund Bus',
    'Superlines Bus',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Card(
              color: const Color(0xFFffffff),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Want to Travel with Us?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Book Now',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: firstName,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon:
                            Icon(Icons.person, color: Colors.grey, size: 20.0),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: lastName,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon:
                            Icon(Icons.person, color: Colors.grey, size: 20.0),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: phoneNumber,
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
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: email,
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
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: destinationplan,
                      decoration: const InputDecoration(
                        labelText: 'Destination',
                        prefixIcon: Icon(Icons.location_on,
                            color: Colors.grey, size: 20.0),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: selectedTransportation,
                      onChanged: (newValue) {
                        setState(() {
                          selectedTransportation = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Transportation',
                        prefixIcon: Icon(Icons.emoji_transportation_rounded,
                            color: Colors.grey, size: 20.0),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                      items: transportationOptions.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        _selectTime(context);
                      },
                      child: Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.access_time,
                                color: Colors.grey, size: 20.0),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Text(
                                selectedTime != null
                                    ? selectedTime!.format(context)
                                    : 'Select Time',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                color: Colors.grey, size: 20.0),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Text(
                                selectedDate != null
                                    ? selectedDate!
                                        .toIso8601String()
                                        .split('T')[0]
                                    : 'Select Date',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
                        child: const Text(
                          'Book',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
