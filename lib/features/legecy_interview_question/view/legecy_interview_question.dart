import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class InterviewScreen extends StatefulWidget {
  @override
  _InterviewScreenState createState() => _InterviewScreenState();
}

class _InterviewScreenState extends State<InterviewScreen> {
  final List<String> questions = [
    'What was life like when you were a kid?',
    'How was my mom/dad as a grandchild?',
    'What is your greatest achievement in life?',
    'What made you decide to date grandma?',
    'What\'s the smartest thing you ever learned?',
    'What are some life gems and knowledge do you want to share with me?',
    'What was life like when you were a kid?', 
  ];

  int? _selectedQuestionIndex = 0; 

  // --- MODAL IMPLEMENTATION ---
void _showAnswerModal(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5), // optional dim background
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select to Answer',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Close button
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Video Button (Orange)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton.icon(
                        onPressed: (){
                          context.push('/appso_questions_video_recording');
                        },
                        icon: SvgPicture.asset(
                          'assets/video_camera_icon.svg',
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          height: 24,
                        ),
                        label: const Text(
                          'Video',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF8542), // Orange
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                  // Audio Button (Blue)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.push('/appso_questions_audio_recording');
                        },
                        icon: SvgPicture.asset(
                          'assets/microphone_icon.svg',
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          height: 24,
                        ),
                        label: const Text(
                          'Audio',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1976D2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
// --- END MODAL IMPLEMENTATION ---



  Widget _buildQuestionCard(String question, int index) {
    bool isSelected = _selectedQuestionIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedQuestionIndex = index; 
        });
        _showAnswerModal(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Custom Radio Button
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.orange.shade700 : Colors.black,
                  width: 2,
                ),
                color: isSelected ? Colors.orange.shade700 : Colors.transparent,
              ),
              child: isSelected
                ? Center(
                  child: Container(
                    width: 10,
                    height: 10,
                     decoration: BoxDecoration(
                      color: Colors.orange.shade700, 
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : null,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                question,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/arrow_right.svg', 
              colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              width: 16,
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F4C82), 
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F4C82), 
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/arrow_back.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Appso Interview',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            // Central Icon
            Container(
              width: 120, 
              height: 120, 
              decoration: BoxDecoration(
                color: Color(0xFFFFE3D2),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15), 
              child: Image.asset(
                'assets/images/in_logo.png', 
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),
            // Introduction Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Start recording answers for the questions below',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Question Cards
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return _buildQuestionCard(
                  questions[index],
                  index,
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}