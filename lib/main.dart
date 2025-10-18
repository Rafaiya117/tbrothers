import 'package:appsoleum/config/app_route/app_router.dart';
import 'package:appsoleum/config/connectvity/no_connectvity.dart';
import 'package:appsoleum/features/auths/complete_profile/controller/profile_video_uploader_controller.dart';
import 'package:appsoleum/features/capture_message/controller/audio_recording_controller.dart';
import 'package:appsoleum/features/capture_message/controller/capture_controller.dart';
import 'package:appsoleum/features/auths/complete_profile/controller/profile_image_upload_controller.dart';
import 'package:appsoleum/features/capture_message/controller/video_recording_controller.dart';
import 'package:appsoleum/features/create_capsule/controller/capsule_controller.dart';
import 'package:appsoleum/features/gallary_and_timeline/gallery/controller/gallary_and_timeline_controller.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/controller/time_line_audio_controller.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/controller/timeline_image_controller.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/controller/timeline_video.dart';
import 'package:appsoleum/features/home_page/controller/home_page_controller.dart';
import 'package:appsoleum/features/home_page/controller/media_player_controller.dart';
import 'package:appsoleum/features/landding/controller/landing_page_controller.dart';
import 'package:appsoleum/features/legacy_create_capsule/controller/legacy_create_capsule_controller.dart';
import 'package:appsoleum/features/legacy_create_capsule/controller/selected_user_controller.dart';
import 'package:appsoleum/features/legacy_take_photo/controller/legecy_capture_image_controller.dart';
import 'package:appsoleum/features/legacy_take_photo/controller/legecy_video_controller.dart';
import 'package:appsoleum/features/legecy_appso_connects/controller/controller.dart';
import 'package:appsoleum/features/legecy_appso_message/controller/appso_msg_controller.dart';
import 'package:appsoleum/features/legecy_interview_question/controller/interview_audio_controller.dart';
import 'package:appsoleum/features/legecy_interview_question/controller/interview_video_controller.dart';
import 'package:appsoleum/features/legecy_profile/controller/edit_profile_image_controller.dart';
import 'package:appsoleum/features/legecy_profile/controller/pr_controller.dart';
import 'package:appsoleum/features/memoriers/controller/memory_controller.dart';
import 'package:appsoleum/features/memoriers/controller/record_audio_memory.dart';
import 'package:appsoleum/features/memoriers/controller/record_video_memory.dart';
import 'package:appsoleum/features/memoriers/controller/recording_controller.dart';
import 'package:appsoleum/features/onboarding_one/controller/onboarding_one_controller.dart';
import 'package:appsoleum/features/profile/controller/edit_controller.dart';
import 'package:appsoleum/features/profile/controller/profile_settings_controller.dart';
import 'package:appsoleum/features/subscription_plan/controller/subscription_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasConnection = true;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    Connectivity().onConnectivityChanged.listen((status) {
      setState(() {
        hasConnection = status != ConnectivityResult.none;
      });
    });
  }

  Future<void> _checkConnectivity() async {
    final status = await Connectivity().checkConnectivity();
    setState(() {
      hasConnection = status != ConnectivityResult.none;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390,844),
      minTextAdapt: true,
      builder: (context,child){
        return MultiProvider(
          providers:[
            ChangeNotifierProvider(create:(_)=>LandingController()),
            ChangeNotifierProvider(create:(_)=>OnboardingOneController()),
            ChangeNotifierProvider(create: (_)=>ProfileImageUploadController()),
            ChangeNotifierProvider(create: (_)=>ProfileVideoUploaderController()),
            ChangeNotifierProvider(create: (_) => HomePageController()),
            ChangeNotifierProvider(create: (_) => CaptureController()),
            ChangeNotifierProvider(create: (_) => RecordingController()),
            ChangeNotifierProvider(create: (_) => CapsuleController()),
            ChangeNotifierProvider(create: (_)=>GalleryTimelineController()),
            ChangeNotifierProvider(create: (_)=>TimelineVideoController()),
            ChangeNotifierProvider(create: (_)=>TimelineImageController()),
            ChangeNotifierProvider(create: (_)=>TimeLineAudioController()),
            ChangeNotifierProvider(create: (_)=>MediaController(mediaUrl: '')),
            ChangeNotifierProvider(create: (_)=> VideoRecordingController()),
            ChangeNotifierProvider(create: (_)=> ProfileSettingsMenuController()),
            ChangeNotifierProvider(create: (_)=> MemoryController()),
            ChangeNotifierProvider(create: (_)=> SubscriptionPlansController()),
            ChangeNotifierProvider(create: (_)=> PasswordController()),
            ChangeNotifierProvider(create: (_)=> EditProfileController()),
            ChangeNotifierProvider(create: (_)=> LegecyCaptureImageController()),
            ChangeNotifierProvider(create: (_)=> LegecyCaptureVideoController()),
            ChangeNotifierProvider(create: (_)=> InterviewVideoController()),
            ChangeNotifierProvider(create: (_)=> InterviewAudioController()),
            ChangeNotifierProvider(create: (_)=> MessageController()),
            ChangeNotifierProvider(create: (_)=> ConnectionsController()),
            ChangeNotifierProvider(create: (_)=> ProfileController()),
            ChangeNotifierProvider(create: (_)=> LegacyCreateCapsuleController()),
            ChangeNotifierProvider(create: (_)=> AccountViewModel()),
            ChangeNotifierProvider(create: (_)=> AccountViewModel()),
            ChangeNotifierProvider(create: (_)=> RecordMediaController()),
            ChangeNotifierProvider(create: (_)=> RecordAudioMemoryController()),
            ChangeNotifierProvider(create: (_)=> RecordVideoMemoryController()),
                       
          ],
          child:MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            routerConfig: appRouter,
            builder: (context, child) {
              return hasConnection ? child! : const NoInternetWidget();
            },
          ),
        );
      },
    );
  }
}

