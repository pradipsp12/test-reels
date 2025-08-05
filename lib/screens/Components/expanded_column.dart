// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:social/constant.dart';
import 'package:social/screens/Components/tag_people.dart';

class ExpandedColumn extends StatelessWidget {
  const ExpandedColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "This shot is just one chapter in a story you’ve been writing with every swing, every setback, every ounce of belief. And the next one? You’ll write that too—with grit, with ",
                  style: TextStyle(color: Colors.white), // base style
                ),
                TextSpan(
                  text: "#grace",
                  style: TextStyle(
                    color: Colors.red, // red text for hashtag
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ", and with the same relentless fire that brought you here.",
                  style: TextStyle(color: Colors.white),
                ),
            
                TextSpan(
                  text: "\n\n #tennis #sports #grinding",
                  style: TextStyle(
                    color: Colors.red, // red text for hashtag
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
    
          Text("\n\nTagged people", style: TextStyle(color: Colors.white),),
    
          SizedBox(height: 20,),
    
           ListTilePlus(
            profileImage: AssetImage("assets/img/profile.jpg"),
            onTapPlus: () {
              
            },
             ),
    
           ListTileCheck(
            profileImage: AssetImage("assets/img/profile.jpg"),
            onTapCheck: (){},
            ),
           ListTileCheck(
            profileImage: AssetImage("assets/img/profile.jpg"),
            onTapCheck: (){},
            ),
    
          TaggedPeopleWidget(
          profileImages: [
            'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
            'https://img.freepik.com/free-photo/stylish-girl-sits-chair_8353-5177.jpg?semt=ais_hybrid&w=740&q=80',
            'https://img.freepik.com/free-photo/close-up-brunette-young-woman_1139-15.jpg',
            'https://img.freepik.com/free-photo/beautiful-girl-stands-park_8353-5086.jpg',
          ],
          onTap: () => print('Tapped!'),
        ),
         
      ]
    );
  }
}


class ListTilePlus extends StatelessWidget {
  const ListTilePlus({
    super.key,required this.profileImage, required this.onTapPlus,
  });
 final ImageProvider profileImage;
 final Function() onTapPlus;
 
  @override
  Widget build(BuildContext context) {
    return Container(
     margin: const EdgeInsets.symmetric(vertical: 4),
     padding: const EdgeInsets.all(12),
     decoration: BoxDecoration(
       color: Colors.grey[850],
       borderRadius: BorderRadius.circular(12),
     ),
     child: Row(
       children: [
          CircleAvatar(
           backgroundImage: profileImage,
           radius: 20,
         ),
         const SizedBox(width: 12),
         const Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("yuki.tamachi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
               Text("name surname", style: TextStyle(color: Colors.white54, fontSize: 12)),
             ],
           ),
         ),
         GestureDetector(
          onTap: onTapPlus,
           child: Container(
             padding: EdgeInsets.all(5),
             decoration: const BoxDecoration(
               shape: BoxShape.circle,
               color: Colors.pinkAccent,
             ),
             child: const Icon(Icons.add, color: Colors.white),
           ),
         ),
       ],
     ),
                                    );
  }
}

class ListTileCheck extends StatelessWidget {
  const ListTileCheck({
    super.key, required this.profileImage,required this.onTapCheck,
  });

  final ImageProvider? profileImage;
  final Function() onTapCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
           CircleAvatar(
            backgroundImage: profileImage,
            radius: 20,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("yuki.tamachi", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("name surname", style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
          GestureDetector(
            onTap:onTapCheck ,
            child: Container(
            padding: EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: const Icon(Icons.check, color: Colors.white),
                    ),
          ),
        ],
      ),
    );
  }
}
