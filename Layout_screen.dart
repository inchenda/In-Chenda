import 'package:flutter/material.dart';
import 'package:flutter_application_1/project_app/About_Us%20.dart';

import 'package:flutter_application_1/project_app/image_data.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;
  bool _isDarkTheme = false; // Track theme state

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkTheme ? _buildDarkTheme() : _buildLightTheme(),
      home: Scaffold(
        backgroundColor: _isDarkTheme ? Colors.black : Colors.white,
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _buildCustomBottomNavigationBar(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Center(
        child: Text('Food Panda App'),
      ),
      backgroundColor: _isDarkTheme ? Colors.grey[900] : Colors.pinkAccent,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(_isDarkTheme ? Icons.dark_mode : Icons.light_mode),
          onPressed: () {
            setState(() {
              _isDarkTheme = !_isDarkTheme; // Toggle theme
            });
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return _buildMainListView();
  }

  Widget _buildCustomBottomNavigationBar() {
  return BottomNavigationBar(
    currentIndex: _currentIndex,
    onTap: (index) {
      setState(() {
        _currentIndex = index;
      });

      if (index == 3) { // When "About Us" is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AboutUsPage()),
        );
      }
    },
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Food'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Grocery'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'About Us'),
    ],
    selectedItemColor: _isDarkTheme ? Colors.tealAccent : Colors.pink,
    unselectedItemColor: _isDarkTheme ? Colors.grey : Colors.grey[400],
  );
}

  ThemeData _buildLightTheme() {
    return ThemeData(
      primaryColor: Colors.pinkAccent,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(color: Colors.pinkAccent),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      primaryColor: Colors.grey[900],
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(color: Colors.black),
    );
  }

  Widget _buildMainListView() {
    return ListView(
      padding: const EdgeInsets.all(10),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildIconRow(),
        const Text(
          "Food Morning",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildListViewBuilderHorizontal(imageList, 200, 180),
        const Text(
          "Food Lunch",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildListViewBuilderHorizontal(imageList2, 200, 180),
        const Text(
          "Food Evening",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildListViewBuilderHorizontal(imageList3, 200, 180),
        const Text(
          "Sweet Popular Khmer",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildListViewBuilderHorizontal(imageList4, 200, 180),
      ],
    );
  }

  Widget _buildIconRow() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildMenuButton(text: "ម្ហូបកម្មង់ផ្ទាល់នៅហាង", myPressed: () {}),
          _buildMenuButton(text: "អាហារក្ដៅៗ", myPressed: () {}),
          _buildMenuButton(text: "អាហារទាន់ចិត្ត", myPressed: () {}),
          _buildMenuButton(text: "Freeថ្លៃដឹក៥០%", myPressed: () {}),
          _buildMenuButton(
              text: "បញ្ចុះតម្លៃពេលមានកម្មវិធីបុណ្យទាន", myPressed: () {}),
          _buildMenuButton(text: "ទិញច្រើនទទួលបានកាដូរ", myPressed: () {}),
          _buildMenuButton(text: "បង្អែមខ្មែរឆ្ងាញ់ៗ", myPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildMenuButton({
    required String text,
    required void Function()? myPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, right: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: _isDarkTheme ? Colors.grey[800] : Colors.white,
          foregroundColor: _isDarkTheme ? Colors.tealAccent : Colors.pinkAccent,
          side: BorderSide(
              color: _isDarkTheme ? Colors.tealAccent : Colors.pinkAccent),
          textStyle: const TextStyle(fontSize: 18),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        ),
        onPressed: myPressed,
        child: Text(text),
      ),
    );
  }

  Widget _buildListViewBuilderHorizontal(
      List<String> list, double h, double w) {
    return SizedBox(
      height: h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Perform action on tap
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Image.network(list[index]),
                ),
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.all(8.0),
              width: w,
              decoration: BoxDecoration(
                border: Border.all(
                    color: _isDarkTheme ? Colors.tealAccent : Colors.pinkAccent,
                    width: 2),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: (_isDarkTheme
                            ? Colors.tealAccent
                            : Colors.pinkAccent)
                        .withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  list[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
   
}

