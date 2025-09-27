import 'package:appsoleum/features/capture_message/view/capture_image.dart';
import 'package:appsoleum/features/capture_message/view/record_audio.dart';
import 'package:appsoleum/features/auths/complete_profile/view/complete_profile_view.dart';
import 'package:appsoleum/features/auths/complete_profile/view/completed_last_profile.dart';
import 'package:appsoleum/features/auths/complete_profile/view/profile_image_upload.dart';
import 'package:appsoleum/features/auths/complete_profile/view/profile_video_uploader.dart';
import 'package:appsoleum/features/auths/forgot_password/view/forgot_password_view.dart';
import 'package:appsoleum/features/auths/login/view/login_view.dart';
import 'package:appsoleum/features/auths/reset_password/view/reset_password.dart';
import 'package:appsoleum/features/auths/signup/view/signup_view.dart';
import 'package:appsoleum/features/auths/verify_otp/view/verify_otp.dart';
import 'package:appsoleum/features/capture_message/view/video_capture.dart';
import 'package:appsoleum/features/create_capsule/view/create_capsule_add_date.dart';
import 'package:appsoleum/features/create_capsule/view/create_capsule_final_view.dart';
import 'package:appsoleum/features/create_capsule/view/create_capsule_note_view.dart';
import 'package:appsoleum/features/create_capsule/view/create_capsule__image_view.dart';
import 'package:appsoleum/features/gallary_and_timeline/gallery/view/gallary_view.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/time_line_audio.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/time_line_image.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/time_line_view.dart';
import 'package:appsoleum/features/gallary_and_timeline/time_lines/view/timeline_video.dart';
import 'package:appsoleum/features/home_page/view/home_page_view.dart';
import 'package:appsoleum/features/landding/view/landing_page.dart';
import 'package:appsoleum/features/media_preview/view/capsule_memory_preview.dart';
import 'package:appsoleum/features/onboarding_one/view/onboarding_one_view.dart';
import 'package:appsoleum/features/profile/view/account_information_view.dart';
import 'package:appsoleum/features/profile/view/edit_account_info.dart';
import 'package:appsoleum/features/profile/view/profile_settings.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LandingPage(),
    ),
    GoRoute(
      path: '/create_account_page',
      builder: (context, state) => OnboardingOneView(),
    ),
    GoRoute(
      path: '/login_page',
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: '/sigup_page',
      builder: (context, state) => SignupView(),
    ),
    GoRoute(
      path: '/forgot_password_page',
      builder: (context, state) => ForgotPasswordView(),
    ),
    GoRoute(
      path: '/verify_otp',
      builder: (context, state) => VerifyOtpView(),
    ),
     GoRoute(
      path: '/reset_password',
      builder: (context, state) => ResetPassword(),
    ),
    GoRoute(
      path: '/complete_profile',
      builder: (context, state) => CompleteProfileView(),
    ),
    GoRoute(
      path: '/profile_image',
      builder: (context, state) => ProfileImageUpload(),
    ),
    GoRoute(
      path: '/profile_video',
      builder: (context, state) => ProfileVideoUploader(),
    ),
    GoRoute(
      path: '/last_completed',
      builder: (context, state) => CompletedLastProfile(),
    ),
    GoRoute(
      path: '/home_page',
      builder: (context, state) => HomePageView(),
    ),
    GoRoute(
      path: '/capture_image',
      builder: (context, state) => CaptureImage(),
    ),
    GoRoute(
      path: '/record_audio',
      builder: (context, state) => RecordAudio(),
    ),
    GoRoute(
      path: '/record_video',
      builder: (context, state) => RecordVideo(),
    ),
    GoRoute(
      path: '/create_capsule',
      builder: (context, state) => CreateCapsuleImageView(),
    ),
    GoRoute(
      path: '/create_capsule_addnote',
      builder: (context, state) => CreateCapsuleNoteView(),
    ),
    GoRoute(
      path: '/create_capsule_add_date',
      builder: (context, state) => CreateCapsuleAddDate(),
    ),
    GoRoute(
      path: '/capsule_final_view',
      builder: (context, state) => CreateCapsuleFinalView(),
    ),
    GoRoute(
      path: '/gallary_view',
      builder: (context, state) => GallaryView(),
    ),
    GoRoute(
      path: '/timeline_view',
      builder: (context, state) => TimeLineView(),
    ),
    GoRoute(
      path: '/video_time_line',
      builder: (context, state) => TimelineVideo(),
    ),
    GoRoute(
      path: '/time_line_image',
      builder: (context, state) => TimeLineImage(),
    ),
    GoRoute(
      path: '/time_line_audio',
      builder: (context, state) => TimeLineAudio(),
    ),
    GoRoute(
      path: '/capsule_preview',
      builder: (context, state) => CapsuleMemoryPreview(),
    ),
    GoRoute(
      path: '/profile_menu_settings',
      builder: (context, state) => ProfileSettingsMenu(),
    ),
    GoRoute(
      path: '/account_info_view',
      builder: (context, state) => AccountInformationView(),
    ),
    GoRoute(
      path: '/edit_account_info',
      builder: (context, state) => EditAccountInfo(),
    ),
  ],
);

   

    
       
