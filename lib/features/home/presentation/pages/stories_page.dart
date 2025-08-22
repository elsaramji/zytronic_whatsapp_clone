import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_clone_flutter/features/stories/data/mocks/mock_stories.dart';
import 'package:whatsapp_clone_flutter/features/stories/data/models/story_model.dart';
import 'package:whatsapp_clone_flutter/features/stories/story_list_itme.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = MockStories.stories;
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
        child: Icon(
          Icons.camera_alt,
          size: 16.sp,
        ),
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
      subtitle: Text('Tap to add status update',
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
