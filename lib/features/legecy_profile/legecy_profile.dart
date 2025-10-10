import 'package:appsoleum/core/utils/theme.dart';
import 'package:appsoleum/features/legecy_profile/controller/edit_profile_image_controller.dart';
import 'package:appsoleum/features/legecy_profile/controller/pr_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Stats UI
  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count,
          style: const TextStyle(
          color: Colors.white, 
          fontSize: 18, 
          fontWeight: FontWeight.bold
        )
      ),
      Text(
        label,
        style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
      ],
    );
  }

  // Filter Button
  Widget _buildFilterButton(BuildContext context, String text, bool isSelected) {
    final controller = Provider.of<EditProfileController>(context, listen: false);
    final GlobalKey? key = controller.filterButtonKeys[text];

    if (key == null) return Container();

    return GestureDetector(
      onTap: () async => await controller.showFilterPopup(context, key, text),
      child: Container(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF7A00) : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }

  // Comment Widget
  Widget _buildComment(BuildContext context,String avatarAsset,String name,String commentText,bool isAudio,String timestamp,{String? audioPath}) {
    final controller = Provider.of<ProfileController>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 20, backgroundImage: AssetImage(avatarAsset)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    if (isAudio) ...[
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: audioPath != null
                          ? () => controller.togglePlayPause()
                          : null,
                        child: SvgPicture.asset('assets/audio_wave.svg',
                          width: 16,
                          colorFilter: ColorFilter.mode(Colors.blue.shade300, BlendMode.srcIn)),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(commentText,
                  style: TextStyle(
                    color: isAudio ? Colors.orange : Colors.white70,
                    fontStyle:isAudio ? FontStyle.italic : FontStyle.normal)),
                const SizedBox(height: 4),
                Text(
                  timestamp,
                  style:TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProfileController>(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppGradientColors.background_color),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: SvgPicture.asset('assets/icons/arrow_back.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              onPressed: () {}),
          title: SvgPicture.asset('assets/images/Logo2.png', height: 30),
          centerTitle: true,
          actions: [
            IconButton(
              icon: SvgPicture.asset('assets/icons/notification.svg',
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/legacy_pf_img.png',
                      width: 120.w,
                      height: 120.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Tom Hayden',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('16,978', 'Views'),
                      Container(width: 1, height: 40, color: Colors.grey.shade600),
                      _buildStatColumn('12,784', 'Connections'),
                      Container(width: 1, height: 40, color: Colors.grey.shade600),
                      _buildStatColumn('16K', 'Comments'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade700,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),),
                    child: const Text(
                      'Explore Legacies',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                  const SizedBox(height: 30),
                   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, 
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildFilterButton(context,'Education',false),
                        const SizedBox(width: 8), 
                        _buildFilterButton(context,'Family',true),
                        const SizedBox(width: 8), 
                        _buildFilterButton(context,'Love & Relationship',false),
                        const SizedBox(width: 8),
                        _buildFilterButton(context,'Career',false),
                        const SizedBox(width: 8),
                        _buildFilterButton(context,'Health',false),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                  // Video card and comments
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xFF2A2E52),
                        borderRadius: BorderRadius.circular(15)),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 70),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Video Thumbnail
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset('assets/images/apsso.png',
                                        width: double.infinity,
                                        height: 200,
                                        fit: BoxFit.cover),
                                    Positioned(
                                      bottom: 16,
                                      left: 16,
                                      child: SvgPicture.asset(
                                          'assets/icons/video_player_icon.svg',
                                          width: 60,
                                          height: 60,
                                          colorFilter:
                                              const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Ethan's 2nd birthday party in",
                                        style: TextStyle(
                                          color: Colors.white, 
                                          fontSize: 18
                                        )
                                      ),
                                    const Text(
                                      "San Jose, California",
                                        style: TextStyle(
                                          color: Colors.white, 
                                          fontSize: 18
                                        )
                                      ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Comments (${controller.comments.length})",
                                        style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: 14
                                          )
                                        ),
                                        
                                    const SizedBox(height: 15),
                                    ...controller.comments.map((c) => _buildComment(
                                          context,
                                          c['avatar'],
                                          c['name'],
                                          c['isAudio']
                                              ? 'Tap to play audio comment'
                                              : c['text'] ?? '',
                                          c['isAudio'],
                                          c['timestamp'],
                                          audioPath: c['audioPath'],
                                        )),
                                    const SizedBox(height: 80),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ✅ Bottom Input
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              border: Border(
                                top: BorderSide(color: Colors.grey.shade800),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Write comments....',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: controller.toggleRecording,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.orange.shade700,
                                        shape: BoxShape.circle),
                                    child: 
                                    Consumer<ProfileController>(
                                      builder: (context, controller, _) {
                                        String iconPath;
                                        if (controller.isRecording) {
                                          iconPath ='assets/icons/recording.svg'; 
                                        } else if (controller.audioPath != null && !controller.isPlaying) {
                                          iconPath = 'assets/icons/play.svg'; 
                                        } else if (controller.isPlaying) {
                                          iconPath = 'assets/icons/pause.svg'; 
                                        } else {
                                          iconPath = 'assets/icons/micro_phone.svg';
                                        }

                                        return GestureDetector(
                                          onTap: () async {
                                            if (controller.isRecording) {
                                              await controller.toggleRecording(); 
                                            } else if (controller.audioPath == null) {
                                              await controller.toggleRecording(); 
                                            } else if (!controller.isPlaying) {
                                              await controller.togglePlayPause(); 
                                            } else {
                                              await controller.togglePlayPause(); 
                                            }
                                          },
                                          onLongPress: () async {
                                            await controller.stopPlayback();
                                          },
                                          child: SvgPicture.asset(
                                            iconPath,
                                            width: 24,
                                            height: 24,
                                            colorFilter: const ColorFilter.mode(
                                              Colors.white,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}