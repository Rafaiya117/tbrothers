import 'package:flutter/material.dart';

class PasswordController extends ChangeNotifier {

  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController reEnterNewPasswordController = TextEditingController();


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> updatePassword(BuildContext context) async {
    if (_isLoading) return;
    if (newPasswordController.text != reEnterNewPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New passwords do not match!')),
      );
      return;
    }

    _isLoading = true;
    notifyListeners();
    
    print('Updating password...');
    print('Current: ${currentPasswordController.text}');
    print('New: ${newPasswordController.text}');

    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password updated successfully! (Simulated)')),
    );
    
    currentPasswordController.clear();
    newPasswordController.clear();
    reEnterNewPasswordController.clear();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    reEnterNewPasswordController.dispose();
    super.dispose();
  }
}
