import 'package:appsoleum/core/components/custom_navigation_bar.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/home_page/controller/home_page_controller.dart';
import 'package:appsoleum/features/home_page/widget/custom_memory_card.dart';
import 'package:appsoleum/features/home_page/widget/quick_action_card.dart';
import 'package:appsoleum/features/home_page/widget/saved_memory_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
 final memoryItems = context.watch<HomePageController>().memoryItems;
 final controller = context.watch<HomePageController>();
 int index = 0;
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          //height: double.infinity,
          decoration: BoxDecoration(
            gradient: AppGradientColors.background_color
          ),
          child: Padding(
            padding:EdgeInsets.symmetric(vertical: 32.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Home",
                      style: GoogleFonts.inter(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: SvgPicture.asset(
                        "assets/icons/notification.svg",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome Back, Sarah 🖐🏻",
                      style: GoogleFonts.inter(
                      color: FontColors.text_colors,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your legacy is growung",
                      style: GoogleFonts.inter(
                      color: FontColors.disable_text,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                MemoryCard(
                  title: 'Birthday Celebrations',
                  description: "Mom's 60th birthday party so much joy!",
                  date: 'Jan 10, 2024',
                  imageUrl: 'assets/images/memory_card.png',
                  isVideo: true,
                  showBorder: true,
                ),
                SizedBox(height: 20.h,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Quick Action",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                      color: FontColors.text_colors
                    ),
                  ),
                ),
                SizedBox(height:20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomActionButton(
                      icon: SvgPicture.asset('assets/icons/micro_phone.svg'),
                      label: 'Record Message', 
                      onTap: () {  },
                    ),
                    SizedBox(width:5.w),
                    CustomActionButton(
                      icon: SvgPicture.asset('assets/icons/upload_image.svg'),
                      label: 'Upload Image', 
                      onTap: () {  },
                    ),
                    SizedBox(width:5.w),
                    CustomActionButton(
                      icon: SvgPicture.asset('assets/icons/create_capsule.svg'),
                      label: 'Create Capsule', 
                      onTap: () {
                        context.push('/capture_image');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Saved Memory",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                      color: FontColors.text_colors,
                    ),
                  ),
                ),
                SizedBox(height:20.h),
                SizedBox(
                  height: 200.h,
                  child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    //padding: const EdgeInsets.symmetric(horizontal: 1),
                    itemCount: memoryItems.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final item = memoryItems[index];
                      return MemoryCardItem(
                        imagePath: item.imagePath,
                        title: item.title,
                        description: item.description,
                        date: item.date,
                      );
                    },
                  ),
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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: FontColors.button_color.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: FontColors.button_color,
          elevation: 0,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 30),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}