// models/chat_model.dart
class Chat {
  final String name;
  final String avatarUrl;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isMuted;

  Chat({
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.isMuted = false,
  });
}

// models/message_model.dart
enum MessageStatus { sent, delivered, read }

class Message {
  final String text;
  final String time;
  final bool isSentByMe;
  final MessageStatus status;

  Message({
    required this.text,
    required this.time,
    required this.isSentByMe,
    this.status = MessageStatus.sent,
  });
}

// models/story_model.dart
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

class StoryItem {
  final String mediaUrl;
  final Duration duration;
  final String caption;

  StoryItem({
    required this.mediaUrl,
    required this.duration,
    this.caption = '',
  });
}
