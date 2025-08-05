
import 'package:flutter/material.dart';

class ExpandedColumnText extends StatelessWidget {
  const ExpandedColumnText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       TextComments()
      ]
    );
  }
}


class TextComments extends StatelessWidget {
  const TextComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText('Every drop of sweat, every sprint to the net,every backhand swing tells a story ofobsession, discipline, and that inner fire that refuses to dim. \n\n You don’t just play tennis—you live it. Hours on the court become a blur. Days off feel like missed chances. You chase perfection knowing it doesn’t exist, but you run anyway. \n\n This shot right here? It\'s not just a moment—it\'s the culmination of countless mornings when no one was watching. Of silent battles with your own doubts. Of pushing past the pain and choosing progress over comfort, of tying your shoes with purpose, knowing today could be the day something clicks. The day your serve lands just right. The day your footwork flows like instinct. The day your mind stays locked in through every rally, no matter how long it goes \n\n You’ve replayed this point in your head a thousand times. Visualized it before sleep. Felt it in your fingertips before you even stepped onto the court. It’s muscle memory now. It’s mindset. It’s more than preparation—it’s obsession made real. \n\n And the crowd? You barely hear them. The noise fades because this moment is personal. It’s not about proving anyone wrong or', style: TextStyle(color: Colors.white),);
  }
}



