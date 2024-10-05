import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:insta_story/data/models/user_model.dart';
import 'package:insta_story/presentation/screens/story_view_screen.dart';

class StoryListScreen extends StatefulWidget {
  final List<User> users;
  final int index;
  const StoryListScreen({super.key, required this.users, required this.index});

  @override
  State<StoryListScreen> createState() => _StoryListScreenState();
}

class _StoryListScreenState extends State<StoryListScreen> {
  final GlobalKey _sliderKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 20,
      ),
      body: CarouselSlider.builder(
        key: _sliderKey,
        initialPage: widget.index,
        itemCount: widget.users.length,
        slideBuilder: (index) {
          final user = widget.users[index];
          return StoryViewScreen(user: user);
        },
        slideTransform: const CubeTransform(),
      ),
    );
  }
}
