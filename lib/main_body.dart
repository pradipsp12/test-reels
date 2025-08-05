import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social/screens/home_screen.dart';
import 'package:social/screens/reels_screen.dart';
import 'package:social/screens/stories.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    const Homescreen(), 
    const Stories(), 
    const ReelsScreen(),
    const Stories(), 
    const Homescreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false, 
          showUnselectedLabels: false,
          iconSize: 35,
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home,),
              label: '', 
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.clone, size: 25,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              activeIcon: Icon(Icons.add_circle_outline, size: 35,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.paperPlane, size: 25,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                 
                  image: DecorationImage(
                    image: AssetImage('assets/img/profile.jpg'), 
                    fit: BoxFit.cover, 
                  ),
                ),
              ),

             
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}