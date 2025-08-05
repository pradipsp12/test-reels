import 'package:flutter/material.dart';

class TaggedPeopleWidget extends StatelessWidget {
  final List<String> profileImages;
  final VoidCallback? onTap;

  const TaggedPeopleWidget({
    super.key,
    required this.profileImages,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 4,),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xFF404040),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
           
            SizedBox(
              width: size.width * 0.26,
              height: 40,
              child: Stack(
                children: [
                  
                  
                  
                    if (profileImages.length > 3)
                    Positioned(
                      left: 75,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(profileImages[2]),
                        ),
                      ),
                    ),
                    if (profileImages.length > 2)
                    Positioned(
                      left: 50,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(profileImages[2]),
                        ),
                      ),
                    ),
                    if (profileImages.length > 1)
                    Positioned(
                      left: 25,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(profileImages[1]),
                        ),
                      ),
                    ),
                    if (profileImages.isNotEmpty)
                    Positioned(
                      left: 0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(profileImages[0]),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            
            const SizedBox(width: 12),
            
            
            const Text(
              'See all tagged people',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const SizedBox(width: 8),
            
           
            const Icon(
              Icons.arrow_outward,
              color: Colors.white70,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
