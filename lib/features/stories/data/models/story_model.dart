
// models/story_model.dart
import 'package:whatsapp_clone_flutter/features/stories/data/models/story_itmes.dart';

class Story {
  final String userName;
  final String avatarUrl;
  final List<StoryItem> storyItems;

  Story({
    required this.userName,
    required this.avatarUrl,
    required this.storyItems,
  });
}

