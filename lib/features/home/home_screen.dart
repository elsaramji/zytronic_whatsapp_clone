import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/features/chats/chat_list_screen.dart';
import 'package:whatsapp_clone_flutter/features/stories/stories_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3, // Number of tabs
      initialIndex: 0,
      child: Scaffold(
        appBar: WhatsAppBar(),
        body: HomeScreenBody(),
      ),
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        ChatListScreen(),
        StoriesListScreen(),
        // Placeholder for Calls Screen
        Center(child: Text('Calls Screen')),
      ],
    );
  }
}

class WhatsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WhatsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'WhatsApp',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 16.sp,
            ),
            onPressed: () {}),
        IconButton(
            icon: Icon(
              Icons.search,
              size: 16.sp,
            ),
            onPressed: () {}),
        IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 16.sp,
            ),
            onPressed: () {}),
      ],
      bottom: const TabBar(
        tabs: [
          Tab(
            text: 'CHATS',
          ),
          Tab(text: 'STATUS'),
          Tab(text: 'CALLS'),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(1.sw, 86.h);
}
