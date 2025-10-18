import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerField extends StatefulWidget {
  final String hintText;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final ValueChanged<DateTime>? onDateSelected;
  final DateTime? initialDate;

  const CustomDatePickerField({
    super.key,
    this.hintText = 'Select date',
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.onDateSelected,
    this.initialDate,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  DateTime? _selectedDate;
  final DateFormat _formatter = DateFormat('dd MMM yyyy');

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? widget.initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        // Dark theme for picker
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.white,
              onPrimary: Colors.black,
              surface: Color(0xFF1E2D4A),
              onSurface: Colors.white,
            ), dialogTheme: DialogThemeData(backgroundColor: const Color(0xFF1E2D4A)),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
      widget.onDateSelected?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDate(context),
      child: Container(
        // width: widget.width ?? 358,
        width:double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? const Color(0xFF1E2D4A), // ✅ updated color
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white,
          )
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          _selectedDate == null
              ? widget.hintText
              : _formatter.format(_selectedDate!),
          style: TextStyle(
            color: _selectedDate == null
                ? Colors.white.withOpacity(0.5)
                : Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
