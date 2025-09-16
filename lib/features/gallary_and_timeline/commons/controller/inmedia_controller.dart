import 'package:flutter/material.dart';

abstract class IMediaToggleController extends Listenable {
  List<String> get options;
  String get selectedOption;
  void selectOption(String option);
}
