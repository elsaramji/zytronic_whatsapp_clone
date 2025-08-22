// widget to display one item of stories list
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/features/stories/data/models/story_model.dart';
import 'package:whatsapp_clone_flutter/features/stories/presentation/pages/story_viewer_screen.dart';

class StoryListItem extends StatelessWidget {
  final Story story;
  const StoryListItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // go to story viewer
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => StoryViewerScreen(story: story),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2.5,
                ),
              ),
              child: CircleAvatar(
                radius: 28.r,
                backgroundImage: CachedNetworkImageProvider(story.avatarUrl),
              ),
            ),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(story.userName,
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 4.h),
                Text('Today, ${DateTime.now().hour}:${DateTime.now().minute}',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
