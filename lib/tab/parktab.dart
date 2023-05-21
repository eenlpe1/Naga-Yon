import 'package:flutter/material.dart';
import '../screens/bookingscreen.dart';

class ParkCard extends StatelessWidget {
  final String imageUrl;
  final String destination;
  final String description;
  final String location;
  final String contactNumber;
  final String openHour;
  final String closingTime;

  const ParkCard({
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
            builder: (context) => ParkDetailsScreen(
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

class ParkDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String destination;
  final String description;
  final String location;
  final String contactNumber;
  final String openHour;
  final String closingTime;

  const ParkDetailsScreen({
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

class ParkTab extends StatelessWidget {
  const ParkTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.vertical, 
      children: const [
        ParkCard(
          imageUrl: 'assets/travelSpots/CalauitSafariPark.jpg',
          destination: 'Calauit Safari Park',
          description:
            'The Calauit Safari Park is a 3,700-hectare game reserve and wildlife sanctuary. This features African giraffes and zebras carried by a supposed translocation habitat trial involving Kenyan President Jomo Kenyatta and Philippine President Ferdinand Marcos.',
          openHour: '9:00 AM',
          closingTime: '6:00 PM',
          contactNumber: '(02) 524-9174',
          location: 'Busuanga, Palawan, Philippines',
        ),
        ParkCard(
          imageUrl: 'assets/travelSpots/Wildlife.jpg',
          destination: 'Albay Park and Wildlife',
          description:
              'Albay Park and Wildlife (APW) serves as the repository and rehabilitation facility for confiscated, donated, retrieved, turned-over or abandoned wildlife species.',
          openHour: '9:00 AM',
          closingTime: '6:00 PM',
          contactNumber: '(02) 929-8418 ',
          location: 'Albay',
        ),
        ParkCard(
          imageUrl: 'assets/travelSpots/FarmPlate.jpg',
          destination: 'Farm Plate',
          description:
              'FarmPlate is Bicols newest best spot to view the Mayon Volcano.',
          location: 'Daraga, Albay',
          contactNumber: '(02) 806-8651 ',
          openHour: '10:00 AM',
          closingTime: '7:00 PM',
        ),
        ParkCard(
          imageUrl: 'assets/travelSpots/SamboFarm.jpg',
          destination: 'Cagayan de Oro',
          description:
              'Sambo Farm is definitely the perfect hangout place to chill and relax while enjoying the sunset and the beauty of nature. You can bring your friends and family for a picnic date or just roam around the area and feel the summer breeze.',
          location: 'Magarao, Camarines Sur',
          contactNumber: '(02) 929-8469 / (02) 929-8418',
          openHour: '10:00 AM',
          closingTime: '7:00 PM',
        ),
        ParkCard(
          imageUrl: 'assets/travelSpots/MayonSkyline.jpg',
          destination: 'Mayon Skyline',
          description:
              'One of the top tourist destination of Albay ONE is the Mayon Skyline (formerly known as Mayon Rest House), it is a facility seated 1000 meters above sea level right at the slope of the Philippines active cone shape volcano, Mayon Volcano.',
          location: 'Tabaco',
          contactNumber: '+63(2)2417960 ',
          openHour: '10:00 AM',
          closingTime: '7:00 PM',
        ),
      ]
    ); 
  }

}


