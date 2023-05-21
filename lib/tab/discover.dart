import 'package:flutter/material.dart';
import '../screens/bookingscreen.dart';

class DiscoverCard extends StatelessWidget {
  final String imageUrl;
  final String destination;
  final String description;
  final String location;
  final String contactNumber;
  final String openHour;
  final String closingTime;

  const DiscoverCard({
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
            builder: (context) => DiscoverDetailsScreen(
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
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imageUrl,
                width: double.infinity,
                height: 150.0,
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

class DiscoverDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String destination;
  final String description;
  final String location;
  final String contactNumber;
  final String openHour;
  final String closingTime;

  const DiscoverDetailsScreen({
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
        title: Text(destination),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: 250.0,
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
            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star_half, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Text(
                description,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 5.0),
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
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookScreen(),
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

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, 
      children: const [
        DiscoverCard(
          imageUrl: 'assets/travelSpots/Intramuros.jpg',
          destination: 'Intramuros',
          description:
              'Intramuros, urban district and historic walled city within Metropolitan Manila, in the Philippines. The name, from the Spanish word meaning “within walls,” refers to the fortified city founded at the mouth of the Pasig River shortly after 1571 by the Spanish conquistador Miguel López de Legazpi.',
          openHour: '9:00 AM',
          closingTime: '6:00 PM',
          contactNumber: '(02) 524-9174',
          location: 'South of the Pasig River',
        ),
        DiscoverCard(
          imageUrl: 'assets/travelSpots/Vigan.jpg',
          destination: 'Calle Crisologo',
          description:
              'Calle Crisologo in Vigan, Ilocos Sur, is one of the most beautiful streets in the Philippines. It boasts centuries-old stone houses, lovely tungsten lamps, and antique cobblestone, where horse-drawn carriages or kalesas are still used for transport.',
          openHour: '9:00 AM',
          closingTime: '6:00 PM',
          contactNumber: '(02) 929-8418 ',
          location: 'Ilocos Sur',
        ),
        DiscoverCard(
          imageUrl: 'assets/travelSpots/CagsawaRuins.jpg',
          destination: 'Cagsawa Ruins',
          description:
              'It is the most famous tourist attractions in Albay, Philippines. It is the main landmark and the highest point of the province of Albay, even in the entire Bicol Region. Its magnificence catches the heart of so many. It is the very first national park in the country.',
          location: 'Albay, Bicol',
          contactNumber: '(02) 806-8651 ',
          openHour: '10:00 AM',
          closingTime: '7:00 PM',
        ),
        DiscoverCard(
          imageUrl: 'assets/travelSpots/Bohol.jpg',
          destination: 'Chocolate Hills',
          description:
              'Chocolate Hills and its immediate environs are relatively flat to rolling topography with elevation ranges from 100 m to 500 m above sea level. These were the uplift of coral deposits and the result of the action of rainwater and erosion.',
          location: 'Bohol',
          contactNumber: '(02) 929-8469 / (02) 929-8418',
          openHour: '10:00 AM',
          closingTime: '7:00 PM',
        ),
        DiscoverCard(
          imageUrl: 'assets/travelSpots/Baguio.jpg',
          destination: 'Mines View Park',
          description:
              'Mines View Park is one of the most famous tourist attractions in Baguio City and it is located just 4.3 kilometers from Session Road. It offers visitors to see an astounding view of Amburayan Valley and adjacent mountains from its high-elevation viewing deck.',
          location: 'Baguio',
          contactNumber: '+63(2)2417960 ',
          openHour: '10:00 AM',
          closingTime: '7:00 PM',
        ),
      ],
    ); 
  }

}
