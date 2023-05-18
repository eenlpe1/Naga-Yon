// ignore_for_file: sized_box_for_whitespace

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/colors.dart';
import '../tab/card.dart';

enum FilterType {
  nameAscending,
  nameDescending,
  regioncodeAscending,
  regioncodeDescending,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> originalCityData = [];
  List<dynamic> cityData = [];
  FilterType currentFilter = FilterType.nameAscending;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    fetchCityData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> fetchCityData() async {
    final response = await http
        .get(Uri.parse('https://ph-locations-api.buonzz.com/v1/cities'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        originalCityData = jsonData['data'] ?? [];
        cityData = originalCityData.toList();
      });
    }
  }

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  void search(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        cityData = originalCityData.toList();
      });
    } else {
      List<dynamic> filteredCityData = originalCityData.where((city) {
        final cityName = city['name'] ?? '';
        return cityName.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
      setState(() {
        cityData = filteredCityData;
      });
    }
  }

  void filterData(FilterType filterType) {
    setState(() {
      currentFilter = filterType;
      switch (filterType) {
        case FilterType.nameAscending:
          cityData.sort((a, b) => (a['name'] ?? '').compareTo(b['name'] ?? ''));
          break;
        case FilterType.nameDescending:
          cityData.sort((a, b) => (b['name'] ?? '').compareTo(a['name'] ?? ''));
          break;
        case FilterType.regioncodeAscending:
          cityData.sort((a, b) =>
              (a['region_code'] ?? '').compareTo(b['region_code'] ?? ''));
          break;
        case FilterType.regioncodeDescending:
          cityData.sort((a, b) =>
              (b['region_code'] ?? '').compareTo(a['region_code'] ?? ''));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Naga'Yon",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF027438),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/icon.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    "Enjoy Hassle-Free Travel with Us!",
                    style: TextStyle(
                      letterSpacing: -0.5,
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Container(
              width: 380,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: search,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 12),
                        hintText: "Search Places",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15,
                        ),
                        prefixIcon: const Icon(Icons.search_rounded,
                            color: Colors.grey),
                        fillColor: Colors.grey.shade300,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.filter_list_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Discover'),
                  Tab(text: 'Cities'),
                  Tab(text: 'Mountains'),
                ],
                labelColor: Colors.black, // Set the text color to black
                indicatorColor: const Color(
                    0xFF027438) // Set the highlight color when tapping
                ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    "Popular Destinations",
                    style: TextStyle(
                      letterSpacing: -0.5,
                      fontSize: 24.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  DestinationCard(
                    imageUrl: 'assets/travelSpots/Palawan.jpg',
                    destination: 'Palawan',
                    description: 'Paris is the capital city of France.',
                    location: 'France',
                  ),
                  DestinationCard(
                    imageUrl: 'assets/travelSpots/Boracay.jpg',
                    destination: 'Boracay',
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
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  HomeScreen(),
                  DestinationTab(),
                  DestinationTab(),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF027438),
              ),
              child: Text(
                'Filters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('Name (Ascending)'),
              onTap: () {
                filterData(FilterType.nameAscending);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Name (Descending)'),
              onTap: () {
                filterData(FilterType.nameDescending);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Region Code (Ascending)'),
              onTap: () {
                filterData(FilterType.regioncodeAscending);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Region Code (Descending)'),
              onTap: () {
                filterData(FilterType.regioncodeDescending);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CityTab extends StatelessWidget {
  const CityTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CityCard(
          imageUrl: 'assets/images/new_york_city.jpg',
          city: 'New York City',
          country: 'United States',
        ),
        CityCard(
          imageUrl: 'assets/images/paris.jpg',
          city: 'Paris',
          country: 'France',
        ),
        CityCard(
          imageUrl: 'assets/images/tokyo.jpg',
          city: 'Tokyo',
          country: 'Japan',
        ),
      ],
    );
  }
}

class CityCard extends StatelessWidget {
  final String imageUrl;
  final String city;
  final String country;

  const CityCard({
    Key? key,
    required this.imageUrl,
    required this.city,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  country,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
