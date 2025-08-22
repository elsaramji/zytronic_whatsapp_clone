import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/features/chats/data/models/chat_model.dart';
import 'package:whatsapp_clone_flutter/features/chats/data/models/massage_model.dart';
import 'package:whatsapp_clone_flutter/features/chats/data/repos/chats_repo.dart';

class BuildingMassage extends StatefulWidget {
  const BuildingMassage({
    super.key,
    required this.context,
    required TextEditingController controller,
    required bool showSendButton,
    required this.chat,
  })  : _controller = controller,
        _showSendButton = showSendButton;

  final BuildContext context;
  final TextEditingController _controller;
  final bool _showSendButton;
  final Chat chat;

  @override
  State<BuildingMassage> createState() => _BuildingMassageState();
}

class _BuildingMassageState extends State<BuildingMassage> {
  @override
  Widget build(BuildContext context) {
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
                    child: TextFormField(
                      controller: widget._controller,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file, color: Colors.grey[500]),
                    onPressed: () {},
                  ),
                  if (!widget._showSendButton)
                    IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.grey[500]),
                      onPressed: () {},
                    ),
                  SizedBox(width: widget._showSendButton ? 0 : 8.w),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),
          InkWell(
            onTap: () {
              // send message
              if (widget._controller.text.isNotEmpty) {
                final message = Message(
                  text: widget._controller.text,
                  time: "${DateTime.now().hour}:${DateTime.now().minute}",
                  isSentByMe: true,
                  status: MessageStatus.sent,
                );

                setState(() {
                  widget.chat.messages.add(message);
                });
                ChatsRepo().updateChat(chat: widget.chat);
                widget._controller.clear();
              }
            },
            child: CircleAvatar(
              radius: 24.r,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                widget._showSendButton ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
