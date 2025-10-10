import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showSuccessDialog(BuildContext context) {
  const Color primaryTextColor = Color(0xFF264653); 
  const Color secondaryTextColor = Color(0xFF6A778B); 
  const Color orangeButtonColor = Color(0xFFF98845);

  showDialog(
    context: context,
    barrierDismissible: true, 
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0), 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Text
                  const Expanded(
                    child: Text(
                      'Message sent to capsule!',
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.close,
                        color: secondaryTextColor, 
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Your video memory has been successfully sent to the capsule. it will be opened on the June 14, 2034',
                style: TextStyle(
                  color: secondaryTextColor,
                  fontSize: 14,
                  height: 1.4, 
                ),
              ),              
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 55, 
                  child: ElevatedButton(
                    onPressed: () {
                     context.push('/home_page'); 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orangeButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

