import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/legecy_profile/controller/edit_profile_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditProfileController>(
      create: (_) => EditProfileController(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF165b9a),
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: SvgPicture.asset(
              'assets/icons/arrow_back.svg',
              width: 16.w,
              height: 16.h,
            ),
          ),
          title: Text(
            'Edit Profile',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Color(0xFF030728)),
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'assets/images/legacy_pf_img.png',
                      height: 284.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 16.h,
                      child: GestureDetector(
                        onTap: () async {
                          final controller = context.read<EditProfileController>();
                          await controller.pickImageAndNavigateToCrop(context, ImageSource.gallery);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.16),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.edit, color: Colors.white, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildTextField(label: 'Name', initialValue: 'Tom Hayden'),
                      _buildTextField(label: 'Job Title', initialValue: 'Senior Business Analysis'),
                      _buildTextField(label: 'Email', initialValue: 'tom.hey1983@gmail.com', keyboardType: TextInputType.emailAddress),
                      // Bio Field
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Bio',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        maxLines: 4,
                        maxLength: 150,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: 'Add description....',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color(0xFF2A2E52),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: Color(0xFF4A90E2), width: 1.5),
                          ),
                          counterStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                          alignLabelWithHint: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Link Accounts',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSocialLinkField(svgAssetPath: 'assets/icons/facebook.svg', hintText: 'facebook.com/', initialValue: 'facebook.com/'),
                      _buildSocialLinkField(svgAssetPath: 'assets/icons/insta_icon.svg', hintText: 'instagram.com/', initialValue: 'instagram.com/'),
                      _buildSocialLinkField(svgAssetPath: 'assets/icons/x.svg', hintText: 'x.com/', initialValue: 'x.com/'),
                      _buildSocialLinkField(svgAssetPath: 'assets/icons/linkedin.svg', hintText: 'linkedin.com/', initialValue: 'linkedin.com/'),
                      _buildSocialLinkField(svgAssetPath: 'assets/icons/tiktok.svg', hintText: 'tiktok.com/', initialValue: 'tiktok.com/'),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: FontColors.button_color
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                context.push('/legecy_home');
                              },
                              borderRadius: BorderRadius.circular(25),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.save, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    'Save',
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    bool isMultiLine = false,
    int? maxLength,
    String? hintText,
    Widget? prefixIcon,
    String? prefixText,
    int maxLines = 1,
    TextInputType? keyboardType,
    double bottomGap = 16,
  }) {
    const Color inputFillColor = Color(0xFF2A2E52);
    const Color valueTextColor = Colors.white;
    const Color hintTextColor = Colors.grey;
    const double borderRadius = 8.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          maxLines: isMultiLine ? null : maxLines,
          keyboardType: isMultiLine ? TextInputType.multiline : keyboardType,
          style: const TextStyle(color: valueTextColor),
          cursorColor: Colors.white,
          maxLength: maxLength,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: hintTextColor),
            filled: true,
            fillColor: inputFillColor,
            prefixIcon: prefixIcon,
            prefixText: prefixText,
            prefixStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Color(0xFF4A90E2), width: 1.5),
            ),
            counterStyle: const TextStyle(color: hintTextColor, fontSize: 12),
          ),
        ),
        SizedBox(height: bottomGap),
      ],
    );
  }

  Widget _buildSocialLinkField({
    required String svgAssetPath,
    required String hintText,
    String initialValue = '',
  }) {
    return _buildTextField(
      label: '',
      initialValue: initialValue,
      hintText: hintText,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SvgPicture.asset(
          svgAssetPath,
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          height: 20,
          width: 20,
        ),
      ),
      prefixText: 'https://',
      bottomGap: 2,
    );
  }
}