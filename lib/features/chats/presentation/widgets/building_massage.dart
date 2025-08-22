import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildingMassage extends StatelessWidget {
  const BuildingMassage({
    super.key,
    required this.context,
    required TextEditingController controller,
    required bool showSendButton,
  })  : _controller = controller,
        _showSendButton = showSendButton;

  final BuildContext context;
  final TextEditingController _controller;
  final bool _showSendButton;

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
                      controller: _controller,
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
          InkWell(
            onTap: () {},
            child: CircleAvatar(
              radius: 24.r,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                _showSendButton ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
