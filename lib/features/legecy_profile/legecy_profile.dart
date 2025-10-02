import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  // Helper method for stats
  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  // Helper method for filter buttons
  Widget _buildFilterButton(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2), // Semi-transparent white
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  // Helper method for comments
  Widget _buildComment(String avatarAsset, String name, String commentText, bool isAudio, String timestamp) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(avatarAsset),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isAudio) ...[
                      SizedBox(width: 5),
                      // Replace with your actual audio icon SVG
                      SvgPicture.asset('assets/audio_wave.svg', width: 16, colorFilter: ColorFilter.mode(Colors.blue.shade300, BlendMode.srcIn)),
                    ],
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  commentText,
                  style: TextStyle(
                    color: isAudio ? Colors.blue.shade300 : Colors.white70,
                    fontStyle: isAudio ? FontStyle.italic : FontStyle.normal,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  timestamp,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
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
      backgroundColor: Colors.blue.shade900, // Or use a BoxDecoration with a LinearGradient for the background
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent to allow scaffold background to show
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/back_arrow.svg', colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          onPressed: () {},
        ),
        title: SvgPicture.asset(
          'assets/appsoleum_logo.svg', // Your app logo SVG
          height: 30, // Adjust as needed
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/notification_icon.svg', colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                // Profile Section
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile_pic.jpg'), // Your image asset
                ),
                SizedBox(height: 10),
                Text(
                  'Tom Hayden',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn('16,978', 'Views'),
                    _buildStatColumn('12,784', 'Connections'),
                    _buildStatColumn('16K', 'Comments'),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Explore Legacies',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 30),
                // Filter Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFilterButton('Education'),
                      _buildFilterButton('Family'),
                      _buildFilterButton('Love & Relationship'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // Video Thumbnail Card
                Container(
                  margin: EdgeInsets.all(20), // Adjust margin as needed
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1), // Dark card background
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/video_thumbnail.jpg', // Your video thumbnail asset
                              width: double.infinity,
                              height: 200, // Adjust height
                              fit: BoxFit.cover,
                            ),
                            // Play icon
                            Positioned(
                              child: SvgPicture.asset(
                                'assets/play_icon.svg', // Your play icon SVG
                                width: 60,
                                height: 60,
                                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                              ),
                            ),
                            // "Family" tag
                            Positioned(
                              top: 15,
                              left: 15,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  'Family',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                            // Timestamp
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '02:53',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ethan's 2nd birthday party in",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "San Jose, California",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Comments (30)",
                              style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                            ),
                            SizedBox(height: 15),
                            // Comment section
                            _buildComment('assets/richard_profile.jpg', 'Richard Robert', 'Tap to play audio comment', true, 'Today 12:40 PM'),
                            _buildComment('assets/michaela_profile.jpg', 'Michaela Robbins', 'Congratulations to my handsome little nephew! Auntie really enjoyed watching you sing and dance at your birthday party - you lit up the room! I\'ll always cherish that memory. I love you so much!', false, 'Yesterday 12:40 PM'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100), // Space for the bottom input
              ],
            ),
          ),
          // Bottom Comment Input
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), // Darker input background
                border: Border(top: BorderSide(color: Colors.grey.shade800)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Write comments....',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: InputBorder.none,
                        isDense: true, // Reduce vertical space
                        contentPadding: EdgeInsets.zero, // Remove default padding
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade700,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/microphone_icon.svg', // Your microphone icon SVG
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}