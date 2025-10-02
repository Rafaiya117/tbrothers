import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum RecordingState {
  initial,    
  recording, 
  recorded, 
  playing,
  paused, 
}

class VideoRecorderScreen extends StatefulWidget {
  final String question;
  final bool isAudioRecording; 

  const VideoRecorderScreen({
    Key? key,
    required this.question,
    this.isAudioRecording = false,
  }) : super(key: key);

  @override
  _VideoRecorderScreenState createState() => _VideoRecorderScreenState();
}

class _VideoRecorderScreenState extends State<VideoRecorderScreen> {
  RecordingState _recordingState = RecordingState.initial;
  Timer? _timer;
  int _secondsRecorded = 0;
  int _totalDuration = 0; // Simulate total duration of recording
  double _playbackProgress = 0.0; // 0.0 to 1.0 for playback progress

  // Simulate starting recording
  void _startRecording() {
    setState(() {
      _recordingState = RecordingState.recording;
      _secondsRecorded = 0;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRecorded < 100) { // Simulate max 100 seconds recording for UI
        setState(() {
          _secondsRecorded++;
        });
      } else {
        _stopRecording();
      }
    });
  }

  // Simulate stopping recording
  void _stopRecording() {
    _timer?.cancel();
    setState(() {
      _recordingState = RecordingState.recorded;
      _totalDuration = _secondsRecorded; // Set recorded duration
      _secondsRecorded = 0; // Reset for display
    });
  }

  // Simulate playing recording
  void _playRecording() {
    setState(() {
      _recordingState = RecordingState.playing;
      _playbackProgress = 0.0;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        if (_playbackProgress < 1.0) {
          _playbackProgress += (0.1 / _totalDuration); // Adjust speed
        } else {
          _stopPlaying();
        }
      });
    });
  }

  // Simulate pausing playing recording
  void _pausePlaying() {
    _timer?.cancel();
    setState(() {
      _recordingState = RecordingState.paused;
    });
  }

  // Simulate stopping playing recording
  void _stopPlaying() {
    _timer?.cancel();
    setState(() {
      _recordingState = RecordingState.recorded; // Go back to recorded state
      _playbackProgress = 0.0;
    });
  }

  // Helper to format time for display
  String _formatDuration(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentTimestamp = _formatDuration(
      _recordingState == RecordingState.recording ? _secondsRecorded : _totalDuration,
    );
    if (_recordingState == RecordingState.initial) {
      currentTimestamp = "00:00"; // Initial state shows 00:00
    } else if (_recordingState == RecordingState.playing || _recordingState == RecordingState.paused) {
      // Show current playback time relative to total duration
      currentTimestamp = _formatDuration((_totalDuration * _playbackProgress).round());
    }


    bool isDoneButtonEnabled = _recordingState == RecordingState.recorded ||
      _recordingState == RecordingState.playing ||
      _recordingState == RecordingState.paused;

    return Scaffold(
      backgroundColor: const Color(0xFF0F4C82), 
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F4C82),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/back_arrow.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Appso Interview',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 250, 
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (!widget.isAudioRecording && _recordingState != RecordingState.initial)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/preview_image.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        if (widget.isAudioRecording || _recordingState == RecordingState.initial)
                          Center(
                            child: SvgPicture.asset(
                              widget.isAudioRecording ? 'assets/microphone_icon.svg' : 'assets/video_camera_icon.svg',
                              width: 80,
                              height: 80,
                              colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
                            ),
                          ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  widget.isAudioRecording ? 'assets/microphone_icon.svg' : 'assets/video_camera_icon.svg',
                                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                                  height: 14,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  widget.isAudioRecording ? 'Audio' : 'Video',
                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Timestamp
                        if (_recordingState != RecordingState.initial) 
                          Positioned(
                            bottom: 15,
                            left: 15,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: _recordingState == RecordingState.recording ? Colors.red.shade700 : Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                currentTimestamp,
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ),
                        if (_recordingState == RecordingState.recorded || _recordingState == RecordingState.paused)
                          Center(
                            child: IconButton(
                              iconSize: 70,
                              icon: SvgPicture.asset(
                                _recordingState == RecordingState.recorded ? 'assets/play_icon.svg' : 'assets/pause_icon.svg',
                                colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
                              ),
                              onPressed: () {
                                if (_recordingState == RecordingState.recorded) {
                                  _playRecording();
                                } else if (_recordingState == RecordingState.paused) {
                                  _playRecording(); // Resume playing
                                }
                              },
                            ),
                          ),
                         // Pause button overlay when playing
                        if (_recordingState == RecordingState.playing)
                          Center(
                            child: IconButton(
                              iconSize: 70,
                              icon: SvgPicture.asset(
                                'assets/pause_icon.svg',
                                colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
                              ),
                              onPressed: _pausePlaying,
                            ),
                          ),

                        // Progress bar when playing
                        if (_recordingState == RecordingState.playing || _recordingState == RecordingState.paused)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: LinearProgressIndicator(
                              value: _playbackProgress,
                              backgroundColor: Colors.white.withOpacity(0.3),
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange.shade700),
                              minHeight: 5.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Question Box
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1976D2), // Lighter blue for question box
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Question',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.question,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Control Buttons (Redo, Record/Stop, Delete)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Redo/Restart button
                      _buildControlCircleButton(
                        iconPath: 'assets/redo_icon.svg',
                        onTap: () {
                          // Simulate restarting
                          _timer?.cancel();
                          setState(() {
                            _recordingState = RecordingState.initial;
                            _secondsRecorded = 0;
                            _totalDuration = 0;
                            _playbackProgress = 0;
                          });
                        },
                      ),
                      const SizedBox(width: 30),
                      // Record/Stop/Play/Pause Button
                      GestureDetector(
                        onTap: () {
                          if (_recordingState == RecordingState.initial) {
                            _startRecording();
                          } else if (_recordingState == RecordingState.recording) {
                            _stopRecording();
                          } else if (_recordingState == RecordingState.recorded) {
                            _playRecording();
                          } else if (_recordingState == RecordingState.playing) {
                            _pausePlaying();
                          } else if (_recordingState == RecordingState.paused) {
                            _playRecording(); // Resume
                          }
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: _recordingState == RecordingState.recording ? Colors.red : Colors.orange.shade700,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                          child: Center(
                            child: _getCentralControlIcon(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      // Delete button
                      _buildControlCircleButton(
                        iconPath: 'assets/delete_icon.svg',
                        onTap: () {
                          // Simulate deleting
                          _timer?.cancel();
                          setState(() {
                            _recordingState = RecordingState.initial;
                            _secondsRecorded = 0;
                            _totalDuration = 0;
                            _playbackProgress = 0;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          // Done Button (fixed at bottom)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF0F4C82), // Same as app bar and background
              border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
            ),
            child: ElevatedButton(
              onPressed: isDoneButtonEnabled ? () {
                // Handle Done action
                print('Done button pressed!');
              } : null, // Disable if not recorded
              style: ElevatedButton.styleFrom(
                backgroundColor: isDoneButtonEnabled ? Colors.orange.shade700 : Colors.grey.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 18),
                elevation: 0,
              ),
              child: Text(
                'Done',
                style: TextStyle(
                  color: isDoneButtonEnabled ? Colors.white : Colors.grey.shade400,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for small circular control buttons
  Widget _buildControlCircleButton({required String iconPath, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF1976D2), // Lighter blue
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }

  // Helper to get the correct icon for the central control button
  Widget _getCentralControlIcon() {
    switch (_recordingState) {
      case RecordingState.initial:
        return SvgPicture.asset(
          'assets/record_icon.svg', // Initial: Record icon
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 36,
          height: 36,
        );
      case RecordingState.recording:
        return SvgPicture.asset(
          'assets/stop_recording_icon.svg', // Recording: Stop icon
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 36,
          height: 36,
        );
      case RecordingState.recorded:
        return SvgPicture.asset(
          'assets/play_icon.svg', // Recorded: Play icon
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 36,
          height: 36,
        );
      case RecordingState.playing:
        return SvgPicture.asset(
          'assets/pause_icon.svg', // Playing: Pause icon
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 36,
          height: 36,
        );
      case RecordingState.paused:
        return SvgPicture.asset(
          'assets/play_icon.svg', // Paused: Play icon
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          width: 36,
          height: 36,
        );
    }
  }
}