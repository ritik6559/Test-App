import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_app/features/home/screens/home_screen.dart';
import 'package:intern_app/features/search/screens/search_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  List screens =  [
    const HomeScreen(),
     SearchScreen(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        inactiveColor: Colors.grey,
        activeColor: Colors.white,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
