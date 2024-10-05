import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insta_story/data/models/story_model.dart';
import 'package:insta_story/data/models/user_model.dart';
import 'package:insta_story/presentation/widgets/stories_progress_indicator.dart';
import 'package:insta_story/presentation/widgets/story_image_viewer.dart';
import 'package:insta_story/presentation/widgets/story_video_viewer.dart';
import 'package:insta_story/core/story_controller.dart';

class StoryViewScreen extends StatefulWidget {
  final User user;
  const StoryViewScreen({super.key, required this.user});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen>
    with TickerProviderStateMixin {
  int currentStoryIndex = 0;
  final StoryController _storyController = StoryController();
  late List<AnimationController> _animationControllers;

  @override
  void initState() {
    super.initState();
    _animationControllers = widget.user.stories.map((story) {
      return AnimationController(
        vsync: this,
        duration: const Duration(seconds: 10),
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _nextStory();
          }
        });
    }).toList();
    _animationControllers[currentStoryIndex].forward();
    _storyController.playbackNotifier.listen((playbackState) {
      if (playbackState == PlaybackState.pause) {
        _animationControllers[currentStoryIndex].stop();
      } else if (playbackState == PlaybackState.play) {
        _animationControllers[currentStoryIndex].forward();
      }
    });
  }

  @override
  void dispose() {
    _storyController.dispose();
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _nextStory() {
    setState(() {
      if (currentStoryIndex < widget.user.stories.length - 1) {
        _animationControllers[currentStoryIndex].reset();
        currentStoryIndex++;
        _animationControllers[currentStoryIndex].forward();
      } else {
        Navigator.pop(context);
      }
    });
  }

  void _pauseStory() {
    _storyController.pause();
  }

  void _resumeStory() {
    _storyController.play();
  }

  Widget _buildStoryMedia(Story story) {
    if (story.mediaType == 'image') {
      return StoryImageViewer(story: story, controller: _storyController);
    } else if (story.mediaType == 'video') {
      return StoryVideoViewer(story: story, controller: _storyController);
    }
    return const Center(child: Text('Unsupported media'));
  }

  @override
  Widget build(BuildContext context) {
    final stories = widget.user.stories;
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: GestureDetector(
          onTap: _nextStory,
          onLongPressStart: (_) => _pauseStory(),
          onLongPressEnd: (_) => _resumeStory(),
          child: Stack(
            children: [
              _buildStoryMedia(stories[currentStoryIndex]),
              Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: StoriesProgressIndicator(
                  stories: stories,
                  animationControllers: _animationControllers,
                  currentStoryIndex: currentStoryIndex,
                ),
              ),
              Positioned(
                top: 30,
                left: 10,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: widget.user.profilePicture.isNotEmpty
                          ? CachedNetworkImageProvider(
                              widget.user.profilePicture)
                          : null,
                      child: widget.user.profilePicture.isEmpty
                          ? const Icon(Icons.person)
                          : null,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.user.userName,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                right: 10,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stories[currentStoryIndex].text,
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      stories[currentStoryIndex].textDescription,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              width: mediaQuery.size.width * 0.76,
              child: SearchBar(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).scaffoldBackgroundColor,
                ),
                elevation: const WidgetStatePropertyAll(0),
                side: WidgetStatePropertyAll(BorderSide(
                  color: Theme.of(context).dividerColor,
                )),
                hintText: 'Send message',
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border_rounded),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send_rounded),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
