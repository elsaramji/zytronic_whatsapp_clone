import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/features/home/presentation/pages/chats_page.dart';
import 'package:whatsapp_clone_flutter/features/home/presentation/pages/stories_page.dart';
import 'package:whatsapp_clone_flutter/features/home/presentation/widgets/bottom_app_bar.dart';
import 'package:whatsapp_clone_flutter/features/home/presentation/widgets/chats_app_bar.dart';
import 'package:whatsapp_clone_flutter/features/stories/presentation/widgets/status_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // الشاشات اللي هتظهر حسب الـ index
  final List<Widget> _screens = const [
    ChatsPage(),
    StoriesPage(),
  ];
  final List _appBars = const [ChatsAppBar(), StausAppBar()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_selectedIndex],
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
