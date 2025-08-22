import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/core/mocks/mock_data.dart';
import 'package:whatsapp_clone_flutter/features/home/presentation/widgets/chat_list_item.dart';

class ChatsList extends StatelessWidget {
  const ChatsList.ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = MockData.chats;
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatListItem(chat: chat);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.chat,
          size: 16.sp,
        ),
      ),
    );
  }
}
