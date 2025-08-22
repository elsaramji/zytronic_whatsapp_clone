import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/features/chats/data/models/chat_model.dart';
import 'package:whatsapp_clone_flutter/features/chats/presentation/widgets/building_massage.dart';
import 'package:whatsapp_clone_flutter/features/chats/presentation/widgets/conversation.dart';
import 'package:whatsapp_clone_flutter/features/chats/presentation/widgets/conversation_app_bar.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;
  const ChatScreen({super.key, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _showSendButton = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _showSendButton = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConversationAppBar(chat: widget.chat),
      body: Column(
        children: [
          Expanded(
            child: Conversation(),
          ),
          BuildingMassage(
            context: context,
            controller: _controller,
            showSendButton: _showSendButton,
          ),
        ],
      ),
    );
  }
}
