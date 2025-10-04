import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/profile/controller/edit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PasswordController>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFF2B3A61),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2B3A61),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow_back.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Password',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset('assets/wifi_icon.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn), width: 24, height: 24),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset('assets/battery_icon.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn), width: 24, height: 24),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildPasswordField(
                      controller: controller.currentPasswordController,
                      hintText: 'Enter Current Password',
                      iconPath: 'assets/icons/password_icon.svg',
                      isFirst: true, // No top border radius
                    ),                
                    _buildPasswordField(
                      controller: controller.newPasswordController,
                      hintText: 'Enter New Password',
                      iconPath: 'assets/icons/password_icon.svg',
                      isMiddle: true, // No border radius
                    ),
                    _buildPasswordField(
                      controller: controller.reEnterNewPasswordController,
                      hintText: 'Re-enter New Password',
                      iconPath: 'assets/icons/password_icon.svg',
                      isLast: true, // No bottom border radius
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Consumer<PasswordController>(
                builder: (context, controller, child) {
                  return ElevatedButton(
                    onPressed: controller.isLoading ? null : () => controller.updatePassword(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7B3D),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: controller.isLoading
                      ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                      : const Text(
                      'Update Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required String iconPath,
    bool isFirst = false,
    bool isMiddle = false,
    bool isLast = false,
  }) {

    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 14,horizontal: 16,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFFF7B3D), width: 2),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 12.0),
            child: SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(
                Color(0xFFFF7B3D),
                BlendMode.srcIn,
              ),
              width: 20,
              height: 20,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
        ),
      ),
    );
  }
}