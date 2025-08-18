import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:whatsapp_clone_flutter/data/models/all_models.dart';

class StoryViewerScreen extends StatefulWidget {
  final Story story;
  const StoryViewerScreen({super.key, required this.story});

  @override
  State<StoryViewerScreen> createState() => _StoryViewerScreenState();
}

class _StoryViewerScreenState extends State<StoryViewerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _currentStoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _playStory(_currentStoryIndex);

    // listen to animation status to move to the next story
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextStory();
      }
    });
  }

  // function to play story
  void _playStory(int index) {
    _animationController.stop();
    _animationController.reset();
    _animationController.duration = widget.story.storyItems[index].duration;
    _animationController.forward();
  }

  // function to move to the next story
  void _nextStory() {
    if (_currentStoryIndex < widget.story.storyItems.length - 1) {
      setState(() => _currentStoryIndex++);
      _playStory(_currentStoryIndex);
    } else {
      Navigator.of(context).pop(); // close the story viewer
    }
  }

  // function to move to the previous story
  void _previousStory() {
    if (_currentStoryIndex > 0) {
      setState(() => _currentStoryIndex--);
      _playStory(_currentStoryIndex);
    }
  }

  // function to handle tap down
  void _onTapDown(TapDownDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (details.globalPosition.dx < screenWidth / 3) {
      _previousStory();
    } else {
      _nextStory();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentStoryItem = widget.story.storyItems[_currentStoryIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: _onTapDown,
        onLongPress: () =>
            _animationController.stop(), // stop story on long press
        onLongPressUp: () => _animationController.forward(), // puse story stop long press
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: currentStoryItem.mediaUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 50.h,
              left: 10.w,
              right: 10.w,
              child: Column(
                children: [
                  // story progress bar
                  Row(
                    children: List.generate(
                      widget.story.storyItems.length,
                      (index) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: StoryProgressBar(
                            animationController: _animationController,
                            isActive: index == _currentStoryIndex,
                            isCompleted: index < _currentStoryIndex,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  // story user info
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage:
                            CachedNetworkImageProvider(widget.story.avatarUrl),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        widget.story.userName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            Shadow(blurRadius: 10.0, color: Colors.black54)
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close,
                            color: Colors.white, size: 28),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// widget to display story progress bar
class StoryProgressBar extends StatelessWidget {
  final AnimationController animationController;
  final bool isActive;
  final bool isCompleted;

  const StoryProgressBar({
    super.key,
    required this.animationController,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.h,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (isCompleted) {
            return Container(color: Colors.white); // شريط مكتمل
          }
          if (isActive) {
            // بناء الشريط المتحرك باستخدام AnimatedBuilder
            return AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: constraints.maxWidth * animationController.value,
                    color: Colors.white,
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink(); // شريط فارغ
        },
      ),
    );
  }
}
