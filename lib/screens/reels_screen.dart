// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:social/constant.dart';
import 'package:social/screens/Components/custom_bottom_sheet.dart';
import 'package:social/screens/Components/expanded_column.dart';
import 'package:social/screens/Components/expanded_column_text.dart';
import 'package:video_player/video_player.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _showPlayButton = false;
  DateTime? _lastTapTime;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    );

    try {
      await _controller.initialize();
      setState(() {
        _isInitialized = true;
      });
      _controller.play();
    } catch (e) {
      print("Error initializing video: $e");
    }

    _controller.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  void _togglePlayPause() {
    if (!_isInitialized) return;

    final now = DateTime.now();
    if (_lastTapTime != null &&
        now.difference(_lastTapTime!) < Duration(milliseconds: 300)) {
      // Jodi double tab detect hoy
      return;
    }
    _lastTapTime = now;

    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _showPlayButton = true;
      } else {
        _controller.play();
        _showPlayButton = false;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        GestureDetector(
          onTap: _togglePlayPause,
          child: SizedBox.expand(
            child: _isInitialized
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
          ),
        ),

        if (_showPlayButton && _isInitialized)
          Center(
            child: GestureDetector(
              onTap: _togglePlayPause,
              child: Icon(
                Icons.play_circle_fill,
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.7),
                size: 80,
              ),
            ),
          ),

        if (_isInitialized)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: VideoProgressIndicator(
              _controller,
              allowScrubbing: true,
              colors: VideoProgressColors(
                playedColor: Colors.red,
                bufferedColor: Colors.grey,
                // ignore: deprecated_member_use
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),

        Positioned(
          top: 50,
          left: 10,
          child: Row(
            children: [
              Icon(Icons.houseboat, color: Colors.white),
              SizedBox(width: 5),
              Text(
                "Monnet",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontSize: 20
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 50,
          right: 10,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: bgColor,
                ),
                child: Text(
                  "Sports",
                  style: TextStyle(color: Colors.white60, letterSpacing: 1),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: bgColor,
                ),
                child: Icon(Icons.tune, color: Colors.white54),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 90,
          right: 15,
          child: Column(
            children: [
              Icon(Icons.favorite, size: 45, color: Colors.redAccent),
              SizedBox(height: 7),
              Text("4,120", style: TextStyle(color: Colors.white)),
              SizedBox(height: 25),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: bgColor,
                    isScrollControlled: true,

                    builder: (context) => BottomsheetCustom(
                      username: "adidastensis",
                      commentTitle: 'Focus. Fire. Follow-through.',
                      userProfile: AssetImage('assets/img/profile.jpg'),
                      time: '6 hours ago',
                      bottomSheet: ExpandedColumnText(),
                    ),
                  );
                },
                child: Icon(LucideIcons.messageCircle, size: 45, color: Colors.white)),
              SizedBox(height: 7),
              Text("120", style: TextStyle(color: Colors.white)),
              SizedBox(height: 25),
              Icon(CupertinoIcons.paperplane, size: 45, color: Colors.white),
              SizedBox(height: 7),
              Text("12", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          left: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "adidastensis",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: bgColor,
                    isScrollControlled: true,

                    builder: (context) => BottomsheetCustom(
                      username: "adidastensis",
                      commentTitle: 'Focus. Fire. Follow-through.',
                      userProfile: AssetImage('assets/img/profile.jpg'),
                      time: '6 hours ago',
                      bottomSheet: ExpandedColumn(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      "Focus.Fire.Follow-through",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(width: 10),
                    Container(width: 30, height: 13, color: Colors.white),
                    SizedBox(width: 30),
                    Icon(
                      FontAwesomeIcons.chevronUp,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
