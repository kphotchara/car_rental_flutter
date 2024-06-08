import 'package:car_rental_flutter/explorepage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  List widgetOptions = [
    Text('Homepage'), 
    Explorepage(),
    Text('My Trips'),
    Text('Profile')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: widgetOptions[currentIndex]
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Color.fromRGBO(0, 125 , 252 , 1),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.drive_eta),
                label: 'My Trips',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              )
            ],
        currentIndex : currentIndex,
        onTap :(value) => setState(() {
          currentIndex = value;
        })
      ),
    );
  }
}