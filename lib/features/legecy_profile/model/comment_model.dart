class CommentModel {
  final String avatar;
  final String name;
  final String text;
  final bool isAudio;
  final String timestamp;
  final String? audioPath;

  CommentModel({
    required this.avatar,
    required this.name,
    required this.text,
    required this.isAudio,
    required this.timestamp,
    this.audioPath,
  });
}
