
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/features/stories/data/models/story_model.dart';
import 'package:whatsapp_clone_flutter/features/stories/presentation/widgets/story_progress_bar.dart';

class StoryControllers extends StatelessWidget {
  const StoryControllers({
    super.key,
    required this.story,
    required AnimationController animationController,
    required int currentStoryIndex,
  })  : _animationController = animationController,
        _currentStoryIndex = currentStoryIndex;

  final Story story;
  final AnimationController _animationController;
  final int _currentStoryIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // story progress bar
        Row(
          children: List.generate(
            story.storyItems.length,
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
              backgroundImage: CachedNetworkImageProvider(story.avatarUrl),
            ),
            SizedBox(width: 10.w),
            Text(
              story.userName,
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
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ],
    );
  }
}
