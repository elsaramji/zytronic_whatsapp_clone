import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/data/mock_data.dart';
import 'package:whatsapp_clone_flutter/data/models/all_models.dart';
import 'package:whatsapp_clone_flutter/features/chats/widgets/chat_bubble.dart';

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
      appBar: AppBar(
        leadingWidth: 80.w,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CircleAvatar(
              radius: 20.r,
              backgroundImage:
                  CachedNetworkImageProvider(widget.chat.avatarUrl),
            ),
          ],
        ),
        title: Text(widget.chat.name,
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
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
            ),
          ),
          _buildMessageInputBar(),
        ],
      ),
    );
  }

  Widget _buildMessageInputBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.emoji_emotions_outlined,
                        color: Colors.grey[500]),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file, color: Colors.grey[500]),
                    onPressed: () {},
                  ),
                  if (!_showSendButton)
                    IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.grey[500]),
                      onPressed: () {},
                    ),
                  SizedBox(width: _showSendButton ? 0 : 8.w),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          CircleAvatar(
            radius: 24.r,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(
              _showSendButton ? Icons.send : Icons.mic,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
