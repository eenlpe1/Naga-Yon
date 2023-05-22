// ignore_for_file: sized_box_for_whitespace

import 'dart:math';
import 'package:finalproject/screens/loginscreen.dart';
import 'package:finalproject/screens/searchscreen.dart';
import 'package:finalproject/tab/citytab.dart';
import 'package:finalproject/tab/parktab.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/colors.dart';
import '../tab/discover.dart';
import 'bookingscreen.dart';

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

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
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
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(right: 0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
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
              width: 5,
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
                  const SizedBox(width: 5),
                  PopupMenuButton<FilterType>(
                    onSelected: (FilterType selectedFilter) {
                      filterData(selectedFilter);
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<FilterType>>[
                      const PopupMenuItem<FilterType>(
                        value: FilterType.nameAscending,
                        child: Text('Name Ascending'),
                      ),
                      const PopupMenuItem<FilterType>(
                        value: FilterType.nameDescending,
                        child: Text('Name Descending'),
                      ),
                      const PopupMenuItem<FilterType>(
                        value: FilterType.regioncodeAscending,
                        child: Text('Region Code Ascending'),
                      ),
                      const PopupMenuItem<FilterType>(
                        value: FilterType.regioncodeDescending,
                        child: Text('Region Code Descending'),
                      ),
                    ],
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(5),
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
            // TabBar
            TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Discover'),
                  Tab(text: 'Province'),
                  Tab(text: 'Park'),
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
                    "Recommendation",
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
            // TabBarView),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  DiscoverTab(),
                  CitiesTab(),
                  ParkTab(),
                ],
              ),
            ),
            const SizedBox(height: 30),
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
            const SizedBox(height: 5),
            ListTile(
              leading: const Icon(
                Icons.home,
                size: 30.0,
              ),
              title: const Text('Home',style: TextStyle( fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            const SizedBox(height: 5),
            ListTile(
              leading: const Icon(
                Icons.menu_book_rounded,
                size: 30.0,
              ),
              title: const Text('Book',style: TextStyle( fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookScreen(destination: '',)),
                );
              },
            ),
            const SizedBox(height: 5),
            ListTile(
              leading: const Icon(
                Icons.search_rounded,
                size: 30.0,
              ),
              title: const Text('Search', style: TextStyle( fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
            ),
            const SizedBox(height: 5),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
                size: 30.0,
              ),
              title: const Text('Log out',style: TextStyle( fontWeight: FontWeight.bold)),
              onTap: () {
                _logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
