import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CustomBottomNavBar({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Color(0xFF2A2E52),
//       currentIndex: currentIndex,
//       onTap: (index) {
//         onTap(index); // call parent handler

//         // handle navigation
//         switch (index) {
//           case 0:
//             Navigator.pushReplacementNamed(context, '/home');
//             break;
//           case 1:
//             Navigator.pushReplacementNamed(context, '/care');
//             break;
//           case 2:
//             Navigator.pushReplacementNamed(context, '/menu');
//             break;
//           case 3:
//             Navigator.pushReplacementNamed(context, '/notifications');
//             break;
//           case 4:
//             context.push('/profile');
//             break;
//         }
//       },
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.white70,
//       type: BottomNavigationBarType.fixed,
//       items:[
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset('assets/icons/nav_home_icon.svg'),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset('assets/icons/nav_item_video.svg'),
//           label: 'Care',
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset('assets/icons/nav_item_capsules.svg'),
//           label: 'Menu',
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset('assets/icons/nav_item_profile.svg'),
//           label: 'Notification',
//         ),
        
//       ],
//     );
//   }
// }

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF2A2E52),
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index);

        // Navigation logic
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/care');
            break;
          case 2:
             context.push('/capsule_preview');
            //Navigator.pushReplacementNamed(context, '/menu');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 0,
      unselectedFontSize: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _buildNavItem('assets/icons/nav_home_icon.svg', 'Home', 0),
        _buildNavItem('assets/icons/nav_item_video.svg', 'Memories', 1),
        _buildNavItem('assets/icons/nav_item_capsules.svg', 'Capsules', 2),
        _buildNavItem('assets/icons/nav_item_profile.svg', 'Profile', 3),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(String iconPath, String label, int index) {
    final bool isSelected = currentIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        //margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: isSelected
            ? BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFE8641), Color(0x802A2E52),],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                //borderRadius: BorderRadius.circular(12),
              )
            : null,
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              color: isSelected ? Colors.white : Colors.white70,
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}
