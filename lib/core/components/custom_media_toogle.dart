import 'package:flutter/material.dart';

class CustomNavTab extends StatelessWidget {
  final List<NavItem> items;
  final Widget currentScreen;

  const CustomNavTab({
    Key? key,
    required this.items,
    required this.currentScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.map((item) {
        final isSelected = item.screen.runtimeType == currentScreen.runtimeType;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (!isSelected) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item.screen),
                );
              }
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    item.label,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.white24,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: isSelected ? 40 : 0,
                      height: 2,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class NavItem {
  final String label;
  final Widget screen;

  NavItem({required this.label, required this.screen});
}
