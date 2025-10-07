import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppsoMessagePage extends StatelessWidget {
  const AppsoMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {
        'name': 'Noah Reed',
        'date': 'Delivered August 13, 2028',
        'profile': 'assets/profile_image.png', // replace with your asset
      },
      {
        'name': 'Noah Reed',
        'date': 'Delivered August 13, 2028',
        'profile': 'assets/profile_image.png',
      },
      {
        'name': 'Noah Reed',
        'date': 'Delivered August 13, 2028',
        'profile': 'assets/profile_image.png',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0E1834),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1834),
        elevation: 0,
        title: const Text(
          'Appso Message',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/back_arrow.svg', // your back arrow svg
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2376DD),
                Color(0xFF1A4C8D),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E3D69),
              Color(0xFF0F1834),
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return _buildMessageCard(context, message);
          },
        ),
      ),
    );
  }

  Widget _buildMessageCard(BuildContext context, Map<String, dynamic> message) {
    TextEditingController textController = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2342),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- HEADER (Profile + Name + Date) ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  message['profile'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/calendar_icon.svg', // your date svg
                          height: 14,
                          colorFilter: const ColorFilter.mode(Colors.white70, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          message['date'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // --- TEXT FIELD ---
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF131B36),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextField(
              controller: textController,
              maxLength: 500,
              maxLines: 5,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: const InputDecoration(
                hintText: 'Write Your text Here',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
                counterText: '',
              ),
              onChanged: (_) => {},
            ),
          ),
          const SizedBox(height: 8),

          // --- CHARACTER COUNT + SEND BUTTON ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '0/500',
                style: TextStyle(color: Colors.white54, fontSize: 13),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7A00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
