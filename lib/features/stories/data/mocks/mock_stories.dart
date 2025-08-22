import 'package:whatsapp_clone_flutter/features/stories/data/models/story_itmes.dart';
import 'package:whatsapp_clone_flutter/features/stories/data/models/story_model.dart';

/*

  MockStories is a class that contains a list of mock stories.*/
class MockStories {
  static final List<Story> stories = [
    Story(
      userName: 'My Status',
      avatarUrl: 'https://i.pravatar.cc/150?u=my_status',
      storyItems: [
        StoryItem(
            mediaUrl:
                'https://images.unsplash.com/photo-1539635278303-d4002c07eae3',
            duration: const Duration(seconds: 10)),
      ],
    ),
    Story(
      userName: 'Jane Doe',
      avatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
      storyItems: [
        StoryItem(
            mediaUrl:
                'https://images.unsplash.com/photo-1470770841072-f978cf4d019e',
            duration: const Duration(seconds: 10)),
        StoryItem(
            mediaUrl:
                'https://images.unsplash.com/photo-1441974231531-c6227db76b6e',
            duration: const Duration(seconds: 10)),
      ],
    ),
    Story(
      userName: 'John Smith',
      avatarUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026705d',
      storyItems: [
        StoryItem(
            mediaUrl:
                'https://images.unsplash.com/photo-1475924156734-496f6cac6ec1',
            duration: const Duration(seconds: 10)),
      ],
    ),
  ];
}
