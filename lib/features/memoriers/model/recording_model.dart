class RecordMediaModel {
  final bool isRecording;
  final bool isAudioMode;

  RecordMediaModel({
    this.isRecording = false,
    this.isAudioMode = true,
  });

  RecordMediaModel copyWith({
    bool? isRecording,
    bool? isAudioMode,
  }) {
    return RecordMediaModel(
      isRecording: isRecording ?? this.isRecording,
      isAudioMode: isAudioMode ?? this.isAudioMode,
    );
  }
}
