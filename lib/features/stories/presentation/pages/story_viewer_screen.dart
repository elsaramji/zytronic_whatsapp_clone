import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/features/stories/data/models/story_model.dart';
import 'package:whatsapp_clone_flutter/features/stories/presentation/widgets/story_contant.dart';
import 'package:whatsapp_clone_flutter/features/stories/presentation/widgets/story_controllers.dart';

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
        // handle tap down
        onTapDown: _onTapDown,
        // handle long press
        onLongPress: () =>
            _animationController.stop(), // stop story on long press
        // handle long press up
        onLongPressUp: () =>
            _animationController.forward(), // puse story stop long press
        child: Stack(
          children: [
            // story content
            Positioned.fill(
              child: StoryContant(currentStoryItem: currentStoryItem),
            ),
            // story controllers
            Positioned(
              top: 50.h,
              left: 10.w,
              right: 10.w,
              child: StoryControllers(
                  story: widget.story,
                  animationController: _animationController,
                  currentStoryIndex: _currentStoryIndex),
            ),
          ],
        ),
      ),
    );
  }
}
