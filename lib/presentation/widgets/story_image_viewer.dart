import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:insta_story/data/models/story_model.dart';
import 'package:insta_story/core/story_controller.dart';

class StoryImageViewer extends StatefulWidget {
  const StoryImageViewer({
    super.key,
    required this.story,
    this.controller,
    this.fit = BoxFit.cover,
    this.loadingWidget,
    this.errorWidget,
  });

  final Story story;
  final StoryController? controller;
  final BoxFit fit;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  @override
  State<StoryImageViewer> createState() => _StoryImageViewerState();
}

class _StoryImageViewerState extends State<StoryImageViewer> {
  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.playbackNotifier.listen((playbackState) {
        if (playbackState == PlaybackState.pause) {
          // Handle pause state if necessary
        } else {
          // Handle play state if necessary
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.story.mediaUrl,
      fit: widget.fit,
      width: double.infinity,
      height: double.infinity,
      placeholder: (context, url) =>
          widget.loadingWidget ??
          const Center(
            child: CircularProgressIndicator(),
          ),
      errorWidget: (context, url, error) =>
          widget.errorWidget ?? const Icon(Icons.error),
    );
  }
}
