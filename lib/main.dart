import 'package:flutter/material.dart';
import 'package:social/main_body.dart';


void main() {
  runApp(const SocialReelsApp());
}

class SocialReelsApp extends StatelessWidget {
  const SocialReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Reels',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'SF Pro Display',
      ),
      home: const MainNavigationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
