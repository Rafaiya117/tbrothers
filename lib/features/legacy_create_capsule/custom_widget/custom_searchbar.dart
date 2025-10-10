import 'package:flutter/material.dart';

const Color accentOrange = Color(0xFFFA8939);
class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;

  final String hintText;
  final VoidCallback onSearchPressed;
  final double buttonWidth;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Search Recipients',
    required this.onSearchPressed,
    this.buttonWidth = 80.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35, 
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          Container(
            width: buttonWidth,
            padding: EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: accentOrange,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
            ),
            child: TextButton(
              onPressed: onSearchPressed,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}