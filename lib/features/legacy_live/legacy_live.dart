import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class LegacyLivePage extends StatefulWidget {
  final List<CameraDescription> availableCameras;

  const LegacyLivePage({super.key, required this.availableCameras});
  
  @override
  _LegacyLivePageState createState() => _LegacyLivePageState();
}

class _LegacyLivePageState extends State<LegacyLivePage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _isCameraReady = false;

  @override
  void initState() {
    super.initState();
    _initializeLiveStream(); 
  }


  Future<void> _initializeLiveStream() async {
    if (widget.availableCameras.isEmpty) {
      print('Error: No cameras available.');
      setState(() => _isCameraReady = false);
      return;
    }

    // 1. Initialize the controller with the first available camera
    _controller = CameraController(
      widget.availableCameras.first,
      ResolutionPreset.medium,
    );

    // 2. Start the initialization process
    _initializeControllerFuture = _controller!.initialize().then((_) {
      if (!mounted) return;
      setState(() {
        _isCameraReady = true;
      });
    }).catchError((e) {
      print('Camera initialization error: $e');
      if (e is CameraException) {
        // Handle common errors like permission denied
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Camera Error: ${e.description}')),
        );
      }
      setState(() => _isCameraReady = false);
    });

    // 3. Wait for the controller to initialize (for immediate preview)
    await _initializeControllerFuture;
  }

  @override
  void dispose() {
    // 4. Dispose the controller when the state is removed
    _controller?.dispose();
    super.dispose();
  }

  Widget _buildCameraPreview() {
    if (!_isCameraReady || _controller == null || !_controller!.value.isInitialized) {
      // Show the original blue container with a loading indicator
      return Container(
        color: const Color(0xFF1565C0),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white70),
        ),
      );
    }

    // Show the actual camera preview, ensuring it fits the container dimensions
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * _controller!.value.aspectRatio;
    if (scale < 1) scale = 1 / scale;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Transform.scale(
        scale: scale,
        child: Center(
          child: CameraPreview(_controller!),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Legacy Live',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      return Container(
                        decoration: BoxDecoration(
                          // The color is removed here as the preview will cover it,
                          // but kept for the loading state (inside _buildCameraPreview)
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        // THE CAMERA PREVIEW IS NOW HERE
                        child: Stack(
                          children: [
                            Positioned.fill(child: _buildCameraPreview()),
                            // The bottom action bar remains over the video feed
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      _buildActionButton(icon: Icons.person, text: '0'),
                                      _buildActionButton(icon: Icons.remove_red_eye, text: '0'),
                                      _buildActionButton(icon: Icons.star, text: '0'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isCameraReady ? () {
                    // Logic for actually STARTING the live stream (sending data)
                    print('Go Live button pressed! Camera is ready.');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Live Stream Started! (Integration required)')),
                    );
                  } : null, // Disable button if camera isn't ready
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7043),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    _isCameraReady ? 'Go Live' : 'Initializing...',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
}