import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoryContant extends StatelessWidget {
  const StoryContant({
    super.key,
    required this.currentStoryItem,
  });

  final currentStoryItem;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: currentStoryItem.mediaUrl,
      fit: BoxFit.cover,
    );
  }
}
