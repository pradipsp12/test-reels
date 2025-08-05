import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:social/constant.dart';
import 'package:social/screens/Components/expanded_column.dart';

import 'package:social/screens/Components/expanded_column_text.dart';

class BottomsheetCustom extends StatelessWidget {
  const BottomsheetCustom({super.key, required this.username, required this.commentTitle, required this.userProfile, required this.time});
  final String username;
  final String commentTitle;
  final String time;
  final ImageProvider userProfile;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      maxChildSize: 0.95,
      minChildSize: 0.4,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 60,
                        height: 4,
                        margin: EdgeInsets.only(
                          bottom: 16,
                          left: size.width * 0.18,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: userProfile,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                         Text(
                          username,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                     Text(
                      commentTitle,
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                     Text(
                      time,
                      style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 16),

                    
                    Expanded(
                      child: Scrollbar(
                        controller: scrollController,
                        thickness: 2, 
                        radius: const Radius.circular(2),
                        thumbVisibility: true,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: ExpandedColumn(),
                            // child: ExpandedColumnText(),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Bottom button or action area
                    Center(
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.link_sharp,
                              color: Colors.redAccent,
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            const Text(
                              "www.adidas.com",
                              style: TextStyle(color: bgColor, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Right side: Action icons
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   IconButton(
                    padding: EdgeInsets.zero,
                    icon:Icon(Icons.favorite,size: 45, color: Colors.redAccent), onPressed: (){}, ),
                  const SizedBox(height: 7),
                  const Text("4,120", style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 25),
                  const Icon(
                    LucideIcons.messageCircle,
                    size: 45,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 7),
                  const Text("120", style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 25),
                  const Icon(
                    CupertinoIcons.paperplane,
                    size: 45,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 7),
                  const Text("12", style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 25),
                  const Icon(Icons.more_horiz, size: 45, color: Colors.white),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}



