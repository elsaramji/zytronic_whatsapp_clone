// models/chat_model.dart
import 'package:whatsapp_clone_flutter/features/chats/data/models/massage_model.dart';

class Chat {
  final String name;

  final String avatarUrl;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isMuted;
  final List<Message> messages;

  Chat({
    required this.name,
    required this.avatarUrl,
    required this.lastMessage,
    required this.time,

    this.messages = const [],
    this.unreadCount = 0,
    this.isMuted = false,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        name: json['name'] as String,
        avatarUrl: json['avatarUrl'] as String,
        lastMessage: json['lastMessage'] as String,
        time: json['time'] as String,
        unreadCount: json['unreadCount'] as int? ?? 0,
        isMuted: json['isMuted'] as bool? ?? false,
        messages: (json['messages'] as List<dynamic>? ?? [])
            .map((e) => Message.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'avatarUrl': avatarUrl,
        'lastMessage': lastMessage,
        'time': time,
        'unreadCount': unreadCount,
        'isMuted': isMuted,
        'messages': messages.map((e) => e.toJson()).toList(),
      };
}
