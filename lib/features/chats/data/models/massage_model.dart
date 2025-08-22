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