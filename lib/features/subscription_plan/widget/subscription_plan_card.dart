import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlanCard extends StatelessWidget {
  final String planName;
  final String price;
  final List<String> features;
  final String buttonText;
  final Color buttonColor;
  final bool isViewerPlan;

  const PlanCard({
    super.key,
    required this.planName,
    required this.price,
    required this.features,
    required this.buttonText,
    required this.buttonColor,
    this.isViewerPlan = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF474A69),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Plan Name
          Text(
            planName,
            style: const TextStyle(
              color: Colors.white, 
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          // Price
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),          
          // ADDED DIVIDER HERE
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(
              color: Color(0xFF5A6A8E), 
              thickness: 1,
              height: 0,
            ),
          ),
          Text(
            'Available features on this plan',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),

          // Features List (or single note for Viewer plan)
          Expanded(
            child: isViewerPlan
                ? Text(
                    features.first,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13,
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: features.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/check_circle.svg',
                              colorFilter: const ColorFilter.mode(
                                  Color(0xFF86D5A2), BlendMode.srcIn), // Green color
                              width: 16,
                              height: 16,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                features[index],
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 12),

          // Upgrade Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
                print('${planName} Upgrade button pressed!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}