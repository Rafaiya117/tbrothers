import 'dart:ui';

import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/memoriers/widget/custom_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});
  static const Color darkBlue = Color(0xFF2B3A61);
  static const Color primaryOrange = Color(0xFFFF7B3D);
  static const Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF017FDC),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/back_arrow.svg',
            colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Legacy Drop',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradientColors.background_color,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Title Field
              const Text('Title', style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildTextField(hintText: 'Enter memory title'),
              const SizedBox(height: 24),

              // 2. Add Media Section
              const Text('Add Media', style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text('Add photos, video, or audio to your capsule.', style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 12),
              const _MediaPickerWidget(), // The custom media picker card
              const SizedBox(height: 24),

              // 3. Add Text (Text Area)
              const Text('Add text', style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildTextArea(hintText: 'Describe your memory'),
              const SizedBox(height: 24),

              // 4. Location Field
              const Text('Location', style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildTextField(hintText: 'Where is the memory made?'),
              const SizedBox(height: 32),
              //5. Date
              CustomDatePickerField(
                hintText: "Select memory date",
                onDateSelected: (date) {
                  print("Picked: $date");
                },
              ),
              const SizedBox(height: 32),
              // 6. Done Button
              ElevatedButton(
                onPressed: () {
                  context.push('/home_page');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryOrange,
                  foregroundColor: textColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for standard single-line text fields (Title, Location)
  Widget _buildTextField({required String hintText}) {
    return TextFormField(
      style: const TextStyle(color: textColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        filled: true,
        fillColor: Color(0xFF1E2D4A), 
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white70, width: 1.0), // White outline
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryOrange, width: 2.0), // Orange focus
        ),
      ),
    );
  }

  // Helper method for multi-line text area (Describe your memory)
  Widget _buildTextArea({required String hintText}) {
    return TextFormField(
      style: const TextStyle(color: textColor),
      maxLines: 5, // Approximate height
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade600),
        filled: true,
        fillColor: Color(0xFF1E2D4A),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.white70, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryOrange, width: 2.0),
        ),
      ),
    );
  }
}

// Custom Widget for the "Add Media" section
class _MediaPickerWidget extends StatelessWidget {
  const _MediaPickerWidget();

  static const Color darkBlue = Color(0xFF2B3A61);
  static const Color primaryOrange = Color(0xFFFF7B3D);
  static const Color textColor = Colors.white;
  static const Color mediaContainerColor = Color(0xFF1E2D4A);

  void _showMediaPickerModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E2D4A), // matches your theme
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Choose an option",
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Upload from gallery
              ListTile(
                leading: const Icon(Icons.photo_library, color: primaryOrange),
                title: const Text(
                  "Upload from Gallery",
                  style: TextStyle(color: textColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // TODO: Handle gallery upload
                },
              ),
              const Divider(color: Colors.white24),

              // Record new video
              ListTile(
                leading: const Icon(Icons.videocam, color: primaryOrange),
                title: const Text(
                  "Record Video",
                  style: TextStyle(color: textColor),
                ),
                onTap: () {
                  context.push('/record_memorypost');
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade600,
        strokeWidth: 1.5,
        dashWidth: 6.0,
        dashSpace: 4.0,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: mediaContainerColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            // Icon Circle
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: darkBlue,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/media_icon.svg',
                colorFilter:const ColorFilter.mode(primaryOrange, BlendMode.srcIn),
                width: 32,
                height: 32,
              ),
            ),
            const SizedBox(height: 12),

            // Texts
            const Text(
              'Add media',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Supported png, jpeg, mov etc',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 24),

            // Add Media Button
            ElevatedButton(
              onPressed: () => _showMediaPickerModal(context), // ✅ Added modal
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryOrange,
                foregroundColor: textColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text(
                'Add Media',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Painter implementation to draw the dashed border
class DashedBorderPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  final Color color;
  final BorderRadius borderRadius;

  DashedBorderPainter({
    this.dashWidth = 6.0,
    this.dashSpace = 4.0,
    this.strokeWidth = 1.0,
    required this.color,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final RRect rrect = borderRadius.toRRect(Offset.zero & size);
    
    // Path for the border
    final Path path = Path();
    path.addRRect(rrect);

    // Apply dashed effect to the path
    Path dashedPath = Path();
    double currentLength = 0.0;
    
    // Get metrics from the path
    for (PathMetric metric in path.computeMetrics()) {
      while (currentLength < metric.length) {
        dashedPath.addPath(
          metric.extractPath(currentLength, currentLength + dashWidth),
          Offset.zero,
        );
        currentLength += dashWidth + dashSpace;
      }
      currentLength = 0.0; // Reset for the next contour (though RRect only has one)
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
