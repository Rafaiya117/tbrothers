import 'package:appsoleum/core/components/custom_button.dart';
import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/create_capsule/controller/capsule_controller.dart';
import 'package:appsoleum/features/legacy_create_capsule/controller/legacy_create_capsule_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


class ImageUploaderView extends StatelessWidget {
  final LegacyCreateCapsuleController controller;
  const ImageUploaderView({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.pickImage,
      child: Container(
        width: 350.w,
        height: 264.h,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            if (controller.images.isNotEmpty)
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      controller.images.first,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Transform.translate(
                      offset: const Offset(8, -8),
                      child: GestureDetector(
                        onTap: () {
                          controller.removeImage(0);
                        },
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            if (controller.images.isNotEmpty) SizedBox(width: 10),

            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                dashPattern: [6, 5],
                strokeWidth: 5,
                color: const Color.fromARGB(255, 4, 131, 228),
                radius: const Radius.circular(10),
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: controller.images.isEmpty
                    ? 350.w
                    : 100.w, // ✅ change width
                height: controller.images.isEmpty
                    ? 264.h
                    : 100.h, // ✅ change height
                decoration: BoxDecoration(
                  color: FontColors.background_color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: controller.images.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/gallary_icon_dashed.svg",
                              width: 54.w,
                              height: 54.h,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Add media',
                              style: GoogleFonts.inter(
                                color: Color(0xFFFFFFFF),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Supported png, jpeg, mov etc.',
                              style: GoogleFonts.inter(
                                color: Color(0xFF84869F),
                                fontWeight: FontWeight.normal,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 200.w,
                              height: 48.h,
                              child: CustomRoundedButton(
                                text: "Add Media",
                                backgroundColor: FontColors.button_color,
                          textColor: Colors.white,
                          onPressed: () {
                            controller.pickImage();
                          },
                        ),
                      ),
                    ],
                  )
                  : SvgPicture.asset(
                    "assets/icons/dashtwo_gallary_icon.svg",
                    width: 18.33.w,
                    height: 16.67.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
