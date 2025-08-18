import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/data/models/all_models.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final sentBubbleColor =
        isDarkMode ? const Color(0xFF005C4B) : const Color(0xFFE7FFDB);
    final receivedBubbleColor =
        isDarkMode ? const Color(0xFF202C33) : Colors.white;

    return Align(
      alignment:
          message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: CustomPaint(
        painter: _BubblePainter(
          color: message.isSentByMe ? sentBubbleColor : receivedBubbleColor,
          isSentByMe: message.isSentByMe,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          constraints: BoxConstraints(maxWidth: 0.75.sw),
          child: Wrap(
            alignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Text(
                message.text,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              SizedBox(width: 8.w),
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                    if (message.isSentByMe) ...[
                      SizedBox(width: 4.w),
                      Icon(
                        _getStatusIcon(message.status),
                        size: 16.sp,
                        color: message.status == MessageStatus.read
                            ? Colors.blueAccent
                            : Colors.grey[500],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
        return Icons.done;
      case MessageStatus.delivered:
        return Icons.done_all;
      case MessageStatus.read:
        return Icons.done_all;
    }
  }
}

// Custom painter to draw the chat bubble with a tail
class _BubblePainter extends CustomPainter {
  final Color color;
  final bool isSentByMe;

  _BubblePainter({required this.color, required this.isSentByMe});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    if (isSentByMe) {
      path.moveTo(size.width - 10, size.height - 10);
      path.lineTo(10, size.height - 10);
      path.quadraticBezierTo(0, size.height - 10, 0, size.height - 20);
      path.lineTo(0, 10);
      path.quadraticBezierTo(0, 0, 10, 0);
      path.lineTo(size.width - 10, 0);
      path.quadraticBezierTo(size.width, 0, size.width, 10);
      path.lineTo(size.width, size.height - 20);
      path.quadraticBezierTo(
          size.width, size.height - 10, size.width - 10, size.height - 10);
      // Tail
      path.lineTo(size.width - 10, size.height);
      path.close();
    } else {
      path.moveTo(10, size.height - 10);
      path.lineTo(size.width - 10, size.height - 10);
      path.quadraticBezierTo(
          size.width, size.height - 10, size.width, size.height - 20);
      path.lineTo(size.width, 10);
      path.quadraticBezierTo(size.width, 0, size.width - 10, 0);
      path.lineTo(10, 0);
      path.quadraticBezierTo(0, 0, 0, 10);
      path.lineTo(0, size.height - 20);
      path.quadraticBezierTo(0, size.height - 10, 10, size.height - 10);
      // Tail
      path.lineTo(10, size.height);
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
