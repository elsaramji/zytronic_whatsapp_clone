import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/features/chats/data/models/chat_model.dart';
import 'package:whatsapp_clone_flutter/features/chats/presentation/widgets/chat_bubble.dart';

class Conversation extends StatefulWidget {
  final Chat chat;
  const Conversation({
    super.key,
    required this.chat,
  });

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const CachedNetworkImageProvider(
            'https://i.pinimg.com/736x/8c/98/99/8c98994518b575bfd8c949e91d20548b.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Theme.of(context).brightness == Brightness.dark
                ? Color(0xFF1F2C34).withAlpha(200)
                : Colors.grey.withAlpha(75),
            BlendMode.darken,
          ),
        ),
      ),
      child: ListView.builder(
        reverse: true,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        itemCount: widget.chat.messages.length,
        itemBuilder: (context, index) {
          // Display messages in reverse order
          final message = widget.chat.messages.reversed.toList()[index];
          return ChatBubble(message: message);
        },
      ),
    );
  }
}
