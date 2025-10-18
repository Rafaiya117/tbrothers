import 'package:appsoleum/features/home_page/controller/media_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
Widget _buildOptionRow({
  required BuildContext context, 
  required String text, 
  required String svgAsset, 
  required VoidCallback onTap,
}) {
  final Color iconColor = Colors.blueGrey.shade600; 

  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop(); 
      onTap(); 
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: [
          SvgPicture.asset(
            svgAsset,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            width: 16,
            height: 16,
          ), 
          const SizedBox(width: 20),
          Text(
            text,
            style: TextStyle(
              color: Colors.blueGrey.shade800,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

void showCaptureOptionsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent, 
    builder: (BuildContext bc) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _buildOptionRow(
              context:context,
              text:'Record Audio',
              svgAsset: 'assets/icons/micro_phone.svg',
              onTap:() {
                context.push('/record_audio');
              },
            ),
            // Record Video Option
            _buildOptionRow(
              context:context,
              text:'Record video',
              svgAsset: 'assets/icons/camera.svg', 
              onTap:() {
                context.push('/record_video');
              },
            ),
            _buildOptionRow(
              context:context,
              text:'Upload from Gallery',
              svgAsset:'assets/icons/gallary_icon.svg' , 
              onTap:() {
                context.push('/capture_image');
                //context.read<MediaController>().pickMedia(); 
              },
            ),
            const SizedBox(height: 10), 
          ],
        ),
      );
    },
  );
}