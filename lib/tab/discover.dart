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
        title: Text(
          destination,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor:
            Colors.transparent, // Set app bar background color to transparent
        elevation: 0, // Remove app bar elevation
        iconTheme: const IconThemeData(
            color: Colors.black), // Set the app bar icon color to black
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: 150.0,
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
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
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
                    builder: (context) => BookScreen(destination: destination),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
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
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DiscoverCard(
                      imageUrl: 'assets/travelSpots/Palawan.jpg',
                      destination: 'El Nido',
                      description:
                          'Known for their pristine beaches, crystal-clear waters, and stunning limestone formations. Explore hidden lagoons, go island hopping, and visit the enchanting Underground River',
                      location: 'Palawan',
                      contactNumber: '(044) 793-0014',
                      openHour: '9:00 AM',
                      closingTime: '6:00 PM',
                    ),
                    DiscoverCard(
                      imageUrl: 'assets/travelSpots/Boracay.jpg',
                      destination: 'Boracay',
                      description: 'Tokyo is the capital city of Japan.',
                      location: 'Japan',
                      contactNumber: '(052) 487-4834 / (052) 487-4167 ',
                      openHour: '8:00 AM',
                      closingTime: '5:00 PM',
                    ),
                    DiscoverCard(
                      imageUrl: 'assets/travelSpots/PuertoGalera.jpg',
                      destination: 'Puerto Galera',
                      description:
                          'Puerto Galera is one of those acclaimed towns located on Philippine island of Mindoro which is known for its dive sites and beautiful beaches. When you take a look at the long curve of its White Beach you will find that it is colorfully backed by beautiful bars as well as resorts on its side.',
                      location: 'Oriental Mindoro',
                      contactNumber: '+63(917)5081775 ',
                      openHour: '10:00 AM',
                      closingTime: '7:00 PM',
                    ),
                    DiscoverCard(
                      imageUrl: 'assets/travelSpots/IslandGarden.jpg',
                      destination: 'Island Garden',
                      description:
                          'It is made up of Samal Island and the smaller Talikud Island in the Davao Gulf. It is part of the Metropolitan Davao area and is two kilometers away from Davao City, the largest city and the primary economic center of Mindanao.',
                      location: 'Davao del Norte',
                      contactNumber: '+63(2)7061668 ',
                      openHour: '10:00 AM',
                      closingTime: '7:00 PM',
                    ),
                    DiscoverCard(
                      imageUrl: 'assets/travelSpots/BuriasIsland.jpg',
                      destination: 'Burias Island',
                      description:
                          'A collection of unique and stunning islets found in Burias Masbate. Burias is one of the 3 major islands of Masbate and has the closest land mass from mainland Luzon. It boasts its vivid rock formations and unspoiled white sand beaches.',
                      location: 'Masbate',
                      contactNumber: '+63(2)5816778 / +63(2)5816160 ',
                      openHour: '10:00 AM',
                      closingTime: '7:00 PM',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
