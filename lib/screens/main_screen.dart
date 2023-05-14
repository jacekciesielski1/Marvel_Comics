import 'package:flutter/material.dart';
import 'package:marvel_comics/pages/home_page.dart';
import 'package:marvel_comics/pages/search_page.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

// main scrren that displays pages as IndexedStack
//you can navigate between pages by bottomnavigationbar
class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final screens = [
    HomeScreen(),
    SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(index: currentIndex, children: screens),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search",
            ),
          ],
          selectedFontSize: 17,
          unselectedFontSize: 12,
          backgroundColor: Colors.red,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.black,
          currentIndex: currentIndex,
        ),
      ),
    );
  }
}
