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

  Map<String, dynamic> toJson() => {
        'text': text,
        'time': time,
        'isSentByMe': isSentByMe,
        'status': status.toString(),
      };

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        text: json['text'],
        time: json['time'],
        isSentByMe: json['isSentByMe'],
        status: json['status'] == 'sent'
            ? MessageStatus.sent
            : json['status'] == 'delivered'
                ? MessageStatus.delivered
                : MessageStatus.read,
      );
}