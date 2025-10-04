import 'package:appsoleum/config/app_route/app_router.dart';
import 'package:appsoleum/config/connectvity/no_connectvity.dart';
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
import 'package:appsoleum/features/memoriers/controller/memory_controller.dart';
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

