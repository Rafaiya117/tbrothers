enum MediaType { photo, video, text }

class TimelineEntry {
  final String title;
  final String date;
  final String imageUrl;
  final MediaType mediaType;

  TimelineEntry({
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.mediaType,
  });
}