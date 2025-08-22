class StoryItem {
  final String mediaUrl;
  final Duration duration;
  final String caption;

  StoryItem({
    required this.mediaUrl,
    required this.duration,
    this.caption = '',
  });
}
