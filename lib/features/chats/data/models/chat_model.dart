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
