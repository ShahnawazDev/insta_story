import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:insta_story/data/models/story_model.dart';
import 'package:insta_story/core/story_controller.dart';

class StoryVideoViewer extends StatefulWidget {
  const StoryVideoViewer({
    super.key,
    required this.story,
    this.controller,
  });

  final Story story;
  final StoryController? controller;

  @override
  State<StoryVideoViewer> createState() => _StoryVideoViewerState();
}

class _StoryVideoViewerState extends State<StoryVideoViewer> {
  late CachedVideoPlayerPlusController _cachedVideoPlayerController;

  @override
  void initState() {
    super.initState();
    _cachedVideoPlayerController = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(widget.story.mediaUrl),
      invalidateCacheIfOlderThan: const Duration(days: 69),
    );

    _cachedVideoPlayerController.initialize().then((_) {
      _cachedVideoPlayerController.play();
      setState(() {});
    });

    if (widget.controller != null) {
      widget.controller!.playbackNotifier.listen((playbackState) {
        if (playbackState == PlaybackState.pause) {
          _cachedVideoPlayerController.pause();
        } else if (playbackState == PlaybackState.play) {
          _cachedVideoPlayerController.play();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _cachedVideoPlayerController.value.isInitialized
        ? CachedVideoPlayerPlus(_cachedVideoPlayerController)
        : const Center(child: CircularProgressIndicator());
  }

  @override
  void dispose() {
    _cachedVideoPlayerController.dispose();
    super.dispose();
  }
}