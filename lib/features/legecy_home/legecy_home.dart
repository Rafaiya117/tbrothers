import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  Widget _buildSocialIcon(String svgAssetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SvgPicture.asset(
        svgAssetPath,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        height: 24,
        width: 24,
      ),
    );
  }

  Widget _buildLegacyFeatureItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFF4A90E2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildLegacyFeaturesGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      children: [
        _buildLegacyFeatureItem(Icons.mic, 'Appso\nMessages'),
        _buildLegacyFeatureItem(Icons.public, 'Appso\nConnects'),
        _buildLegacyFeatureItem(Icons.book, 'Appso\nInterviews'),
        _buildLegacyFeatureItem(Icons.wifi_tethering, 'Appso\nLive'),
      ],
    );
  }

  Widget _buildLegacyLineItem(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2C3038),
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLegacyLineGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 1.5,
      children: [
        _buildLegacyLineItem('Education', 'assets/education.png'),
        _buildLegacyLineItem('Family', 'assets/family.png'),
        _buildLegacyLineItem('Love &\nRelationship', 'assets/love.png'),
        _buildLegacyLineItem('Travel', 'assets/travel.png'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E2129),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: Color(0xFF1E2129),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF2B78E4),
                      Color(0xFF4A90E2),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // 👇 CORRECTED: Using Opacity widget instead of the invalid property
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.2, // Set the desired opacity here
                        child: Image.asset(
                          'assets/profile_bg.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // ... (rest of the Stack children remain the same)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          color: Color(0xFF1E2129),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: Image.asset('assets/profile_pic.png').image,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Icon(Icons.edit, color: Colors.white, size: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {},
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.person_add_alt_1, color: Colors.white, size: 28),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Tom Hayden',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Senior Business Analysis',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildSocialIcon('assets/icons/facebook.svg'),
                                _buildSocialIcon('assets/icons/discord.svg'),
                                _buildSocialIcon('assets/icons/linkedin.svg'),
                                _buildSocialIcon('assets/icons/instagram.svg'),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.email, color: Colors.grey[400], size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'tom.hey1983@gmail.com',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Divider(color: Colors.grey[700]),
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          'My Legacy',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Thanks for coming by and checking out my legacy,\nsurely I live a interesting life and I am so glad that\nmy adventures, education, life experiences ',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15,
                          height: 1.4,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle "More..." tap
                        },
                        child: Text(
                          'More...',
                          style: TextStyle(
                            color: Color(0xFF4A90E2),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      _buildLegacyFeaturesGrid(),
                      SizedBox(height: 30),
                      Text(
                        'Legacy Line',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildLegacyLineGrid(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}