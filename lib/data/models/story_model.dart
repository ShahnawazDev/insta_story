import 'package:intl/intl.dart';

class Story {
  final int storyId;
  final String mediaUrl;
  final String mediaType; // Could be "image" or "video"
  final DateTime timestamp;
  final String text;
  final String textDescription;

  Story({
    required this.storyId,
    required this.mediaUrl,
    required this.mediaType,
    required this.timestamp,
    required this.text,
    required this.textDescription,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      storyId: json['story_id'],
      mediaUrl: json['media_url'],
      mediaType: json['media_type'],
      timestamp: DateFormat("yyyy-MM-ddTHH:mm:ssZ")
          .parse(json['timestamp'], true)
          .toLocal(),
      text: json['text'],
      textDescription: json['text_description'],
    );
  }
}
