
import 'package:flutter/material.dart';
import 'package:insta_story/data/models/story_model.dart';

class StoriesProgressIndicator extends StatelessWidget {
  const StoriesProgressIndicator({
    super.key,
    required this.stories,
    required List<AnimationController> animationControllers,
    required this.currentStoryIndex,
  }) : _animationControllers = animationControllers;

  final List<Story> stories;
  final List<AnimationController> _animationControllers;
  final int currentStoryIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: stories.asMap().entries.map((entry) {
        int index = entry.key;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.5),
            child: AnimatedBuilder(
              animation: _animationControllers[index],
              builder: (context, child) {
                return LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(4),
                  value: index < currentStoryIndex
                      ? 1.0
                      : _animationControllers[index].value,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                );
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
