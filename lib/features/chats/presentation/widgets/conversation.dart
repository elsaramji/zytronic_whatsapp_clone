
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/core/mocks/mock_data.dart';
import 'package:whatsapp_clone_flutter/features/chats/presentation/widgets/chat_bubble.dart';

class Conversation extends StatelessWidget {
  const Conversation({
    super.key,
  });

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
                ? Colors.black.withAlpha(180)
                : Colors.white.withAlpha(76),
            BlendMode.darken,
          ),
        ),
      ),
      child: ListView.builder(
        reverse: true,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        itemCount: MockData.messages.length,
        itemBuilder: (context, index) {
          // Display messages in reverse order
          final message = MockData.messages.reversed.toList()[index];
          return ChatBubble(message: message);
        },
      ),
    );
  }
}

