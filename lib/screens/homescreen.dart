// ignore_for_file: sized_box_for_whitespace

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/colors.dart';

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

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> originalCityData = [];
  List<dynamic> cityData = [];
  FilterType currentFilter = FilterType.nameAscending;

  @override
  void initState() {
    super.initState();
    fetchCityData();
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
                    padding: const EdgeInsets.all(0),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                      size: 29,
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
            const SizedBox(height: 30),
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
            Expanded(
              child: ListView.separated(
                itemCount: cityData.length,
                itemBuilder: (context, index) {
                  final city = cityData[index];
                  return Card(
                    color: getRandomColor(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListTile(
                        title: Text(
                          city['name'] ?? 'N/A',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            const Text('Region Code: '),
                            Text(city['region_code'] ?? 'N/A'),
                          ],
                        ),
                        // trailing: ElevatedButton(
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: const Color(0xFF027438),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //   ),
                        //   onPressed: () {
                        //     // Handle button press
                        //   },
                        //   child: const Text(
                        //     'Book Now',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 12,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10), // Add spacing between cards
              ),
            ),
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
