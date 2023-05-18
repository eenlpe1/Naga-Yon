import 'package:flutter/material.dart';

import '../screens/bookingscreen.dart';

class DestinationCard extends StatefulWidget {
  final String imageUrl;
  final String destination;
  final String description;
  final String location;

  const DestinationCard({
    required this.imageUrl,
    required this.destination,
    required this.description,
    required this.location,
  });

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  bool showDetails = false;
  bool showButton = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          showDetails = !showDetails;
          showButton = !showButton;
        });
      },
      child: Card(
        elevation: 2.0,
        child: Stack(
          children: [
            Container(
              width: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    widget.imageUrl,
                    width: double.infinity,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.destination,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        if (showDetails)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.description),
                              const SizedBox(height: 4.0),
                              Text(widget.location),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            if (showButton)
              Positioned(
                bottom: 0.0,
                right: 8.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF027438),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookScreen()),
                    );
                  },
                  child: const Text('Book'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class DestinationTab extends StatelessWidget {
  const DestinationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        DestinationCard(
          imageUrl: 'assets/travelSpots/Palawan.jpg',
          destination: 'Palawan',
          description: 'Paris is the capital city of France.',
          location: 'France',
        ),
        DestinationCard(
          imageUrl: 'assets/travelSpots/Boracay.jpg',
          destination: 'Vigan',
          description: 'Tokyo is the capital city of Japan.',
          location: 'Japan',
        ),
        DestinationCard(
          imageUrl: 'assets/travelSpots/Legazpi.jpg',
          destination: 'Legazpi',
          description: 'New York City is in the United States.',
          location: 'USA',
        ),
      ],
    );
  }
}
