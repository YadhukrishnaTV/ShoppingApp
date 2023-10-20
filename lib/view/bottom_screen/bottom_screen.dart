import 'package:flutter/material.dart';
import 'package:shopping/view/cart/cart.dart';
import 'package:shopping/view/home_screen/home.dart';
import 'package:shopping/view/saved/saved.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List _screens = [
    Home(),
    Saved(),
    Cart()
    
    ];
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          items: [
           BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),
      
             label: "Saved"),
            BottomNavigationBarItem(
              
              
                icon: Icon(Icons.card_travel),
                
                label: "Cart"
                ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), 
             label: "Settings"),
      
          ]),
    );
  }
}

