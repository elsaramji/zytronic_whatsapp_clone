import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/features/chats/data/models/chat_model.dart';
import 'package:whatsapp_clone_flutter/features/chats/presentation/pages/chat_screen.dart';

class ChatListItem extends StatelessWidget {
  final Chat chat;
  const ChatListItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // **Microinteraction 1: Shared Axis Transition**
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return ChatScreen(chat: chat);
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.scaled,
                child: child,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundImage: CachedNetworkImageProvider(chat.avatarUrl),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.grey[600]
                                  : Colors.grey[400],
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.time,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: chat.unreadCount > 0
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.grey,
                  ),
                ),
                SizedBox(height: 6.h),
                if (chat.unreadCount > 0)
                  CircleAvatar(
                    radius: 12.r,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      chat.unreadCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else if (chat.isMuted)
                  Icon(Icons.volume_off, size: 18.sp, color: Colors.grey)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
