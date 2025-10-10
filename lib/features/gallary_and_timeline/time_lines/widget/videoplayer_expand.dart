import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SimpleVideoViewer extends StatefulWidget {
  final String videoPath;
  const SimpleVideoViewer({super.key, required this.videoPath});

  @override
  State<SimpleVideoViewer> createState() => _SimpleVideoViewerState();
}

class _SimpleVideoViewerState extends State<SimpleVideoViewer> {

  late VideoPlayerController _controller;
  bool get isNetwork => widget.videoPath.startsWith('http');

  @override
  void initState() {
    super.initState();
    _controller = isNetwork
      // ignore: deprecated_member_use
      ? VideoPlayerController.network(widget.videoPath)
      : VideoPlayerController.asset(widget.videoPath);
    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


@override
Widget build(BuildContext context) {
  return _controller.value.isInitialized
      ? Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9, // Wider aspect ratio
              child: VideoPlayer(_controller),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.cancel, color: Colors.redAccent, size: 28),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        )
      : const Center(child: CircularProgressIndicator());
}
}