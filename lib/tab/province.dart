import 'package:flutter/material.dart';
import '../screens/bookingscreen.dart';

class ProvinceCard extends StatelessWidget {
  final String imageUrl;
  final String destination;
  final String description;
  final String location;
  final String contactNumber;
  final String openHour;
  final String closingTime;

  const ProvinceCard({
    Key? key,
    required this.imageUrl,
    required this.destination,
    required this.description,
    required this.location,
    required this.contactNumber,
    required this.openHour,
    required this.closingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProvinceDetailsScreen(
              imageUrl: imageUrl,
              destination: destination,
              description: description,
              location: location,
              contactNumber: contactNumber,
              openHour: openHour,
              closingTime: closingTime,
            ),
          ),
        );
      },
      child: Card(
        elevation: 3.0,
        child: SizedBox(
          width: 200.0,
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageUrl,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProvinceDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String destination;
  final String description;
  final String location;
  final String contactNumber;
  final String openHour;
  final String closingTime;

  const ProvinceDetailsScreen({
    Key? key,
    required this.imageUrl,
    required this.destination,
    required this.description,
    required this.location,
    required this.contactNumber,
    required this.openHour,
    required this.closingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          destination,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            Text(
              destination,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star_half, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 20.0),
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 5.0),
                Text('Open: $openHour - Closing: $closingTime'),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.phone),
                const SizedBox(width: 5.0),
                Text(contactNumber),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 5.0),
                Text(location),
              ],
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookScreen(
                      destination: '',
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
    );
  }
}

class CitiesTab extends StatelessWidget {
  const CitiesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: const ProvinceCard(
            imageUrl: 'assets/travelSpots/Naga.jpg',
            destination: 'City of Naga',
            description:
                'The Pilgrim City of Naga, is a 1st class independent component city in the Bicol Region of the Philippines. According to the 2020 census, it has a population of 209,170 people.',
            openHour: '9:00 AM',
            closingTime: '6:00 PM',
            contactNumber: '(02) 524-9174',
            location: 'Naga. Camarines Sur',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: const ProvinceCard(
            imageUrl: 'assets/travelSpots/Catanduanes.jpg',
            destination: 'Catanduanes',
            description:
                'Catanduanes, island, east-central Philippines, in the Philippine Sea. It is separated from southeastern Luzon (Rungus Point) by the shallow Maqueda Channel. Farming is diversified (rice, corn [maize], copra, abaca) on the hilly, rolling land.',
            openHour: '9:00 AM',
            closingTime: '6:00 PM',
            contactNumber: '(02) 929-8418 ',
            location: 'Catanduanes',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: const ProvinceCard(
            imageUrl: 'assets/travelSpots/Davao.jpg',
            destination: 'Davao',
            description:
                'It is the most populous city in Mindanao and the third largest city in the Philippines. Known for its bustling economic activities, urban build-up and modern amenities, Davao City is one of the most important economies in the island, and the third most important urban center in the Philippines.',
            location: 'Davao City',
            contactNumber: '(02) 806-8651 ',
            openHour: '10:00 AM',
            closingTime: '7:00 PM',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: const ProvinceCard(
            imageUrl: 'assets/travelSpots/Cagayan.jpg',
            destination: 'Cagayan de Oro',
            description:
                'Cagayan is a province of the Philippines in the Cagayan Valley region in the northeast of Luzon Island, and includes the Babuyan Islands to the north. The province borders Ilocos Norte and Apayao to the west, and Kalinga and Isabela to the south. Its capital is Tuguegarao.',
            location: 'Bohol',
            contactNumber: '(02) 929-8469 / (02) 929-8418',
            openHour: '10:00 AM',
            closingTime: '7:00 PM',
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: const ProvinceCard(
            imageUrl: 'assets/travelSpots/Batangas.jpg',
            destination: 'Batangas City',
            description:
                'Batangas City is classified as one of the fastest urbanizing cities of the Philippines, and is known as the "Industrial Port City of Calabarzon". It is home to the Batangas International Port, one of the busiest passenger and container terminals in the Philippines.',
            location: 'Batangas',
            contactNumber: '+63(2)2417960 ',
            openHour: '10:00 AM',
            closingTime: '7:00 PM',
          ),
        ),
      ],
    );
  }
}
