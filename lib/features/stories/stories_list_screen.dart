import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:whatsapp_clone_flutter/data/mock_data.dart';
import 'package:whatsapp_clone_flutter/data/models/all_models.dart';
import 'package:whatsapp_clone_flutter/features/stories/story_viewer_screen.dart';


class StoriesListScreen extends StatelessWidget {
  const StoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = MockData.stories;
    final myStatus = stories.first;
    final recentUpdates = stories.sublist(1);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMyStatus(context, myStatus),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Text(
                'Recent updates',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recentUpdates.length,
              itemBuilder: (context, index) {
                return StoryListItem(story: recentUpdates[index]);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  // widget to display my status
  Widget _buildMyStatus(BuildContext context, Story myStatus) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundImage: CachedNetworkImageProvider(myStatus.avatarUrl),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: 2.w,
              ),
            ),
            child: Icon(Icons.add, size: 20.sp, color: Colors.white),
          ),
        ],
      ),
      title: Text('My status', style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text('Tap to add status update', style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

// widget to display one item of stories list
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
                Text(story.userName, style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 4.h),
                Text('Today, 10:20 AM', style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
