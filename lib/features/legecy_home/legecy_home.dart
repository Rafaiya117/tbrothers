import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  Widget _buildSocialIcon(String svgAssetPath) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SvgPicture.asset(
        svgAssetPath,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        height: 16, 
        width: 16,
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
          child: Icon(icon, color: Colors.white, size: 16),
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
        _buildLegacyFeatureItem(Icons.book_sharp, 'Appso\nInterviews'),
        _buildLegacyFeatureItem(Icons.signal_cellular_alt, 'Legacy\nLive'),
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

  Widget _buildCaptureLegacyButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [Color(0xFFFF7A00), Color(0xFFFF5200)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Capture Legacy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetailsCard(BuildContext context) {
    const Color cardColor = Color(0xFF2C3038);
    return Container(
      margin: const EdgeInsets.only(top: 70), 
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name and Social Icons Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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

                    // Job Title/Company
                    Text(
                      'Senior Business Analyst, KNAlytics',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildSocialIcon('assets/icons/facebook.svg'),
                    _buildSocialIcon('assets/icons/twiter.svg'),
                    _buildSocialIcon('assets/icons/linkedin.svg'),
                    _buildSocialIcon('assets/icons/insta_icon.svg'), 
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.email, color: Colors.grey[400], size: 18),
              SizedBox(width: 8),
              Text(
                'tom.hey1983@gmail.com',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarBackground(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2B78E4),
                Color(0xFF4A90E2),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Image.asset(
            'assets/images/apsso.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 16, 
          bottom: 16,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.edit, color: Colors.grey[700], size: 16),
                SizedBox(width: 4),
                Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    const Color scaffoldBackgroundColor = Color(0xFF1E2129);
    const double appBarExpandedHeight = 280.0;
    const double cardOverlap = 50.0;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: appBarExpandedHeight, 
            floating: false,
            pinned: true,
            elevation: 0,
            backgroundColor: scaffoldBackgroundColor,
            
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {},
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child:IconButton(
                  onPressed: (){
                    context.push('/legacy_edit_profile');
                  }, 
                  icon: SvgPicture.asset(
                    'assets/icons/legecy_profile_edit_icon.svg',
                    width: 20.w,
                    height: 20.h,
                  )
                )
              ),
            ],

            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              background: _buildAppBarBackground(context), 
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Transform.translate(
                  offset: const Offset(0.0, -cardOverlap),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: _buildProfileDetailsCard(context),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Divider(color: Colors.grey[700]),
                      SizedBox(height: 15),
                      Text.rich(
                        TextSpan(
                          text: 'Thanks for coming by and checking out my legacy,\nsurely I live a interesting life and I am so glad that\nmy adventures, education, life experiences ',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                            height: 1.4,
                          ),
                          children: [
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
                        textAlign: TextAlign.start,
                      ),

                      SizedBox(height: 20),
                      _buildLegacyFeaturesGrid(),
                      SizedBox(height: 20),
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
                      _buildCaptureLegacyButton(),
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