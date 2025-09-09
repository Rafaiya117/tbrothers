import 'package:flutter/material.dart';

class CustomCardContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CustomCardContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            // maxHeight: 458,
             maxWidth: 390,
          ),
          child: Container(
            margin: margin ?? const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            padding: padding ?? const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top bar shown only when height is maxed
                //if (constraints.maxHeight == 458)
                  Container(
                    height: 4,
                    width: 60,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                child,
              ],
            ),
          ),
        );
      },
    );
  }
}
