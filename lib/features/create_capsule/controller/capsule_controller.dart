import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CapsuleController extends ChangeNotifier {
  // ---------- Text Controllers ----------!
  final TextEditingController _title = TextEditingController();
  TextEditingController get title => _title;

  final TextEditingController _discription = TextEditingController();
  TextEditingController get discription => _discription;

  CapsuleController() {
    _title.addListener(() {
      notifyListeners();
    });
    _startDate = DateTime.now(); 
    updateProgress();
    //startProgressTimer();
  }

  @override
  void dispose() {
    _title.dispose();
    dateController.dispose();
    _progressTimer?.cancel();
    super.dispose();
  }

  // ---------- Image Picker ----------!
  List<File> _images = [];
  List<File> get images => _images;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _images.add(File(pickedFile.path));
      notifyListeners();
    }
  }

  void removeImage(int index) {
    _images.removeAt(index);
    notifyListeners();
  }

  // ---------- Calendar ----------!
  final TextEditingController dateController = TextEditingController();

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  DateTime get selectedDay => _selectedDay;
  DateTime get focusedDay => _focusedDay;

  
  DateTime _startDate = DateTime.now();
  DateTime get startDate => _startDate;

  void setStartDate(DateTime date) {
    _startDate = date;
    notifyListeners();
  }

  void updateDate(DateTime selected, DateTime focused) {
    _selectedDay = selected;
    _focusedDay = focused;

    // Update the text field
    dateController.text = "${selected.day.toString().padLeft(2, '0')}/"
        "${selected.month.toString().padLeft(2, '0')}/"
        "${selected.year}";
    _startDate = DateTime.now(); 
    notifyListeners();
  }

  DateTime _selectedday = DateTime(2025, 09, 17); 
  DateTime _startdate = DateTime(2025, 09, 15);   

  final DateTime simulatedNow = DateTime(2025, 09, 15);

  //!---------- Day Progress Based on Days Passed ----------!
  double get dayProgress {
    final totalDays = _selectedday.difference(_startdate).inDays;
    final daysPassed = simulatedNow.difference(_startdate).inDays;

    if (totalDays <= 0) return 1.0;

    double progress = daysPassed / totalDays;
    return progress.clamp(0.0, 1.0);
  }

  //!---------- Days Remaining ----------!
  int get daysRemaining {
    final target = _selectedday;
    return target.difference(simulatedNow).inDays;
  }

  //!---------- Full Time Remaining ----------!
Duration get timeRemaining {
  return _selectedday.difference(simulatedNow);
}


  //!---------- Circular Progress (Time in Day) ----------!
  double _progressValue = 0.2;
  double get progressValue => _progressValue;

  void updateProgress() {
    final totalSecondsInDay = 24 * 60 * 60;
    final secondsPassedToday = simulatedNow.hour * 3600 + simulatedNow.minute * 60 + simulatedNow.second;
    _progressValue = secondsPassedToday / totalSecondsInDay;
    notifyListeners();
  }

  Timer? _progressTimer;

  void startProgressTimer() {
    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(Duration(seconds: 60), (_) {
      updateProgress();
    });
  }
}