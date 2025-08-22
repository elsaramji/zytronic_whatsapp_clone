import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/features/chats/data/repos/chats_repo.dart';
import 'package:whatsapp_clone_flutter/features/home/presentation/widgets/chat_list_item.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: ChatsRepo().getChats(),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              return ListView.builder(
                itemCount: asyncSnapshot.data!.length,
                itemBuilder: (context, index) {
                  return ChatListItem(chat: asyncSnapshot.data![index]);
                },
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            }
          }),
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
