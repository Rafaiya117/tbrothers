import 'package:appsoleum/core/components/custom_navigation_bar.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/memoriers/controller/memory_controller.dart';
import 'package:appsoleum/features/memoriers/widget/custom_memory_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class MemoryPost extends StatelessWidget {
  const MemoryPost({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<MemoryController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF017FDC), 
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow_back.svg', 
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: const Text(
          'My Posts',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'assets/wifi_icon.svg', 
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'assets/battery_icon.svg', 
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: AppGradientColors.background_color
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: const [
                PostCard(
                  imageUrl: 'assets/images/img4.png',
                  title: 'Europe Trip',
                  description: 'Amazing adventure across Europe',
                  date: 'June 15, 2025',
                  location: 'Paris, France',
                ),
                PostCard(
                  imageUrl: 'assets/images/img1.png',
                  title: 'First Home',
                  description: 'Keys to our forever home',
                  date: 'June 15, 2025',
                  location: 'Suburban Hills',
                ),
                PostCard(
                  imageUrl: 'assets/images/img4.png',
                  title: 'Europe Trip',
                  description: 'Amazing adventure across Europe',
                  date: 'June 15, 2025',
                  location: 'Paris, France',
                ),
                PostCard(
                  imageUrl: 'assets/images/img1.png',
                  title: 'First Home',
                  description: 'Keys to our forever home',
                  date: 'June 15, 2025',
                  location: 'Suburban Hills',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: controller.selectedIndex,
        onTap: (index) => controller.onNavItemTapped(index),
      ),
    );
  }
}