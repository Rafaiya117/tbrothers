import 'package:appsoleum/features/legecy_profile/controller/edit_profile_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  // Helper for consistent text input styling (No unnecessary changes)
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
  }) {
    const Color inputFillColor = Color(0xFF2E323E);
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
        const SizedBox(height: 16),
      ],
    );
  }

  // Helper for social link text fields (No unnecessary changes)
  Widget _buildSocialLinkField({
    required String svgAssetPath,
    required String hintText,
    String initialValue = '',
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(
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
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. Wrap the widget tree with ChangeNotifierProvider to provide the controller
    return ChangeNotifierProvider(
      create: (context) => EditProfileController(),
      child: Builder(
        builder: (context) {
          // Define constants
          const Color scaffoldBackgroundColor = Color(0xFF1E2129);
          const Color appBarColor = Color(0xFF2B78E4);
          const Color formContainerColor = Color(0xFF23262F);
          
          // Get the controller instance for method calls (listen: false)
          final controller = Provider.of<EditProfileController>(context, listen: false);

          return Scaffold(
            backgroundColor: scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: appBarColor,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // 2. Profile Image Section: Use Consumer to listen for image changes
                  Consumer<EditProfileController>(
                    builder: (context, controller, child) {
                      // Logic to switch between selected file and default asset
                      Widget profileImageWidget;
                      if (controller.imageFile != null) {
                        profileImageWidget = Image.file(
                          controller.imageFile!,
                          fit: BoxFit.cover,
                        );
                      } else {
                        profileImageWidget = Image.asset(
                          'assets/profile_pic.png',
                          fit: BoxFit.cover,
                        );
                      }

                      return Container(
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(color: appBarColor),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned.fill(
                              child: profileImageWidget, // Displays the current image
                            ),
                            Positioned(
                              bottom: 20,
                              child: ElevatedButton.icon(
                                // 3. Call the controller's image picking method
                                onPressed:() {
                                  controller.pickImageAndNavigateToCrop(context);
                                }, 
                                icon: const Icon(Icons.edit, color: Colors.grey, size: 18),
                                label: Text(
                                  'Edit image',
                                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),

                  // Form Section (No unnecessary changes)
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: formContainerColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField(label: 'Name', initialValue: 'Tom Hayden'),
                        _buildTextField(label: 'Job Title', initialValue: 'Senior Business Analysis'),
                        _buildTextField(label: 'Email', initialValue: 'tom.hey1983@gmail.com', keyboardType: TextInputType.emailAddress),
                        
                        // Bio Field
                        const Text('Bio', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
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
                            fillColor: const Color(0xFF2E323E),
                            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none,),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none,),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: const BorderSide(color: Color(0xFF4A90E2), width: 1.5),),
                            counterStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                            alignLabelWithHint: true,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        const Text('Link Accounts', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 16),

                        _buildSocialLinkField(svgAssetPath: 'assets/icons/facebook.svg', hintText: 'facebook.com/', initialValue: 'facebook.com/'),
                        _buildSocialLinkField(svgAssetPath: 'assets/icons/instagram.svg', hintText: 'instagram.com/', initialValue: 'instagram.com/'),
                        _buildSocialLinkField(svgAssetPath: 'assets/icons/x.svg', hintText: 'x.com/', initialValue: 'x.com/'),
                        _buildSocialLinkField(svgAssetPath: 'assets/icons/linkedin.svg', hintText: 'linkedin.com/', initialValue: 'linkedin.com/'),
                        _buildSocialLinkField(svgAssetPath: 'assets/icons/tiktok.svg', hintText: 'tiktok.com/', initialValue: 'tiktok.com/'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Save Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF7A00), Color(0xFFFF5200)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Access the final image file from the controller on save
                            print('Save button pressed! Final Image file: ${controller.imageFile}');
                          },
                          borderRadius: BorderRadius.circular(25),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.save, color: Colors.white),
                              SizedBox(width: 8),
                              Text('Save', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}