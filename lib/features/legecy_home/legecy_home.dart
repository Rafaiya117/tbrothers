import 'package:appsoleum/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget _buildSocialIcon(String svgAssetPath) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SvgPicture.asset(
        svgAssetPath,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        height: 26,
        width: 26,
      ),
    );
  }

  Widget _buildLegacyFeatureItem(
      BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () {
        context.push(route);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF4A90E2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 16),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildLegacyFeaturesGrid(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12), // 👈 gives breathing room
    child: GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      childAspectRatio: 0.8,
      children: [
        _buildLegacyFeatureItem(context, Icons.mic, 'Appso\nMessages', ''),
        _buildLegacyFeatureItem(
            context, Icons.public, 'Appso\nConnects', '/appso_connection'),
        _buildLegacyFeatureItem(
            context, Icons.book_sharp, 'Appso\nInterviews', '/appso_questions'),
        _buildLegacyFeatureItem(
            context, Icons.signal_cellular_alt, 'Legacy\nLive', ''),
      ],
    ),
  );
}


  Widget _buildLegacyLineItem(String title, String imagePath) {
    return SizedBox(
      width: 82,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 82,
              height: 80,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegacyLineGrid() {
    return SizedBox(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          _buildLegacyLineItem('Education', 'assets/images/legacy_line1.png'),
          const SizedBox(width: 12),
          _buildLegacyLineItem('Family', 'assets/images/legacy_line2.png'),
          const SizedBox(width: 12),
          _buildLegacyLineItem(
              'Love & Relationship', 'assets/images/legacy_line3.png'),
          const SizedBox(width: 12),
          _buildLegacyLineItem('Travel', 'assets/images/legacy_line4.png'),
        ],
      ),
    );
  }

  Widget _buildCaptureLegacyButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25,horizontal: 80),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFFFE8641)
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push('/appso_page'),
          borderRadius: BorderRadius.circular(25),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Capture Legacy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 260,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2B78E4), Color(0xFF4A90E2)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Image.asset(
            'assets/images/legacy_pf_img.png',
            fit: BoxFit.cover,
          ),
        ),

        // Edit button
        // Positioned(
        //   right: 150,
        //   bottom: 20,
        //   child: Container(
        //     width: 100,
        //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        //     decoration: BoxDecoration(
        //       // ignore: deprecated_member_use
        //       color: Colors.white.withOpacity(0.5),
        //       borderRadius: BorderRadius.circular(20),
        //       boxShadow: [
        //         BoxShadow(
        //           // ignore: deprecated_member_use
        //           color: Colors.black.withOpacity(0.2),
        //           blurRadius: 5,
        //           offset: const Offset(0, 3),
        //         ),
        //       ],
        //     ),
        //     child: Row(
        //       children: [
        //         Icon(Icons.edit, color: Colors.grey[700], size: 16),
        //         const SizedBox(width: 4),
        //         Align(
        //           alignment: Alignment.center,
        //           child: Text(
        //             'Edit',
        //             style: TextStyle(
        //               color: Colors.grey[700],
        //               fontSize: 14,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget _buildProfileDetailsCard(BuildContext context) {
    return Container(
      width:double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2E52),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // name + social
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tom Hayden',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Senior Business Analysis',
                      style:TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  _buildSocialIcon('assets/icons/facebook.svg'),
                  _buildSocialIcon('assets/icons/twiter.svg'),
                  _buildSocialIcon('assets/icons/linkedin.svg'),
                  _buildSocialIcon('assets/icons/insta_icon.svg'),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.email, color: Colors.grey[400], size: 16),
              const SizedBox(width: 6),
              Text(
                'tom.hey1993@gmail.com',
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF017FDC),
        elevation: 0,
        leading: IconButton(
          icon:SvgPicture.asset(
            'assets/icons/arrow_back.svg',
            width: 16.w,
            height: 10.h,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/legecy_profile_edit_icon.svg',
              width: 19.w,
              height: 21.h,
            ),
            onPressed: () => context.push('/legacy_edit_profile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF030728),
            //gradient: AppGradientColors.background_color,
          ),
          child: Column(
            children: [
              _buildProfileSection(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _buildProfileDetailsCard(context),
              ),
              const SizedBox(height: 20),
              const Text(
                'My Legacy',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.orange),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text.rich(
                  TextSpan(
                    text:'Thanks for coming by and checking out my legacy, surely I live an interesting life and I am so glad that my adventures, education, life experiences ',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                      height: 1.4,
                    ),
                    children: const [
                      TextSpan(
                        text: 'More...',
                        style: TextStyle(
                          color: Color(0xFF4A90E2),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _buildLegacyFeaturesGrid(context),
              ),
              // const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Legacy Line',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              _buildLegacyLineGrid(),
              _buildCaptureLegacyButton(context),
              const SizedBox(height: 20), 
            ],
          ),
        ),
      ),
    );
  }
}
