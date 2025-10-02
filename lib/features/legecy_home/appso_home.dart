import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VideoPlayerPlaceholder extends StatelessWidget {
  const VideoPlayerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/video_thumbnail_baby.jpg',
      fit: BoxFit.cover,
    );
  }
}
//!-------------------!
class LegacyScreen extends StatefulWidget {
  const LegacyScreen({super.key});

  @override
  State<LegacyScreen> createState() => _LegacyScreenState();
}

class _LegacyScreenState extends State<LegacyScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  // Helper widget for an audio comment card
  Widget _buildAudioCommentCard({
    required String profilePicAsset,
    required String name,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue.shade900,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(profilePicAsset),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/play_icon_small.svg', 
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Tap to play audio comment',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 14),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/thumbs_up_icon.svg',
                      colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn), // Blue thumbs up
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '3',
                      style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for a text comment card
  Widget _buildTextCommentCard({
    required String profilePicAsset,
    required String name,
    required String comment,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue.shade900, // Darker blue background for comment
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(profilePicAsset),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  comment,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/thumbs_up_icon.svg',
                      colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn), // Grey thumbs up
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '0', // Example like count
                      style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F4C82), // Deep blue background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F4C82),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/back_arrow.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          onPressed: () {}, // Handle back action
        ),
        title: const Text(
          'My Connections',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/search_icon.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            onPressed: () {}, // Handle search action
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // Appsoleum Logo
                SizedBox(
                  child: Image.asset(
                    'assets/images/logo.png', 

                   fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 30),
                // Explore Legacies Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Explore Legacies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Main Video Card
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1976D2), // Lighter blue for the card
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Video Thumbnail and Overlays
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black, // Placeholder for video
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // --- UPDATED CODE HERE ---
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: const VideoPlayerPlaceholder(), 
                            ),
                            // --- END UPDATED CODE ---

                            // "Family" Tag
                            Positioned(
                              top: 15,
                              left: 15,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700, // Blue for the tag
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Text(
                                  'Family',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                            // Play Button
                            Center(
                              child: SvgPicture.asset(
                                'assets/play_icon.svg',
                                colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
                                width: 50,
                                height: 50,
                              ),
                            ),
                            // Timestamp
                            const Positioned(
                              bottom: 15,
                              right: 15,
                              child: Opacity(
                                opacity: 0.8,
                                child: Chip(
                                  backgroundColor: Colors.black,
                                  label: Text(
                                    '02:53',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Video Title
                      const Text(
                        'Ethan\'s 2nd birthday party in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'San Jose, California',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Write Comments Input Field
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900, // Darker blue for input background
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _commentController,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Write comments....',
                                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/microphone_icon.svg',
                                colorFilter: const ColorFilter.mode(Colors.orange, BlendMode.srcIn),
                                width: 24,
                                height: 24,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Comments Section Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Comments (30)',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View all',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Comment 1: Audio Comment
                      _buildAudioCommentCard(
                        profilePicAsset: 'assets/profile_pic_richard.jpg',
                        name: 'Richard Robert',
                        date: 'Today 12:40 PM',
                      ),
                      const SizedBox(height: 15),
                      // Comment 2: Text Comment
                      _buildTextCommentCard(
                        profilePicAsset: 'assets/profile_pic_michaela.jpg',
                        name: 'Michaela Robbins',
                        comment: 'Congratulations to my handsome little nephew! Auntie really enjoyed watching you sing and dance at your birthday party - you lit up the room! I\'ll always cherish that memory. I love you so much!',
                      ),
                      const SizedBox(height: 100), // Extra space for FAB
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Floating Action Button for "Capture Legacy"
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/plus_icon.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  'Capture Legacy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  elevation: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}