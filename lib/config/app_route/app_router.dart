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
import 'package:appsoleum/features/legacy_create_capsule/view/legacy_add_date.dart';
import 'package:appsoleum/features/legacy_create_capsule/view/legacy_capsule_add_media.dart';
import 'package:appsoleum/features/legacy_create_capsule/view/legacy_capsule_add_note.dart';
import 'package:appsoleum/features/legacy_create_capsule/view/legacy_capsule_final_view.dart';
import 'package:appsoleum/features/legacy_create_capsule/view/selected_user.dart';
import 'package:appsoleum/features/legacy_interview_archived/legecy_interview_archived.dart';
import 'package:appsoleum/features/legacy_live/legacy_live.dart';
import 'package:appsoleum/features/legacy_take_photo/view/capture_legecy_video.dart';
import 'package:appsoleum/features/legecy_appso_connects/legecy_appso_connects.dart';
import 'package:appsoleum/features/legecy_appso_message/legacy_text_message.dart';
import 'package:appsoleum/features/legecy_appso_message/legecy_appso_message.dart';
import 'package:appsoleum/features/legecy_home/legecy_home.dart';
import 'package:appsoleum/features/legecy_interview_question/view/interview_question_audio.dart';
import 'package:appsoleum/features/legecy_interview_question/view/interview_question_videorecording.dart';
import 'package:appsoleum/features/legecy_interview_question/view/legecy_interview_question.dart';
import 'package:appsoleum/features/legecy_profile/legacy_edit_profile.dart';
import 'package:appsoleum/features/legecy_profile/legecy_profile.dart';
import 'package:appsoleum/features/legacy_take_photo/view/legecy_take_photo.dart';
import 'package:appsoleum/features/media_preview/view/capsule_memory_preview.dart';
import 'package:appsoleum/features/memoriers/view/create_memory_post.dart';
import 'package:appsoleum/features/memoriers/view/memory_post.dart';
import 'package:appsoleum/features/onboarding_one/view/onboarding_one_view.dart';
import 'package:appsoleum/features/privacy_policy/privacy_policy.dart';
import 'package:appsoleum/features/profile/view/account_information_view.dart';
import 'package:appsoleum/features/profile/view/edit_account_info.dart';
import 'package:appsoleum/features/profile/view/edit_password.dart';
import 'package:appsoleum/features/profile/view/profile_settings.dart';
import 'package:appsoleum/features/subscription_plan/view/subscription_plan.dart';
import 'package:appsoleum/features/terms_and_condition/terms_and_condition.dart';
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
      builder: (context, state) {
        final accountType = state.extra as String;
        return LoginView(accountType: accountType);
      },
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
    GoRoute(
      path: '/memory_post',
      builder: (context, state) => MemoryPost(),
    ),
    GoRoute(
      path: '/subscription_plan',
      builder: (context, state) => SubscriptionPlansPage(),
    ),
    GoRoute(
      path: '/edit_password',
      builder: (context, state) => EditPasswordPage(),
    ),
    GoRoute(
      path: '/terms_condition',
      builder: (context, state) => TermsConditionsPage(),
    ),
    GoRoute(
      path: '/privacy_policy',
      builder: (context, state) => PrivacyAndPolicy(),
    ),
    GoRoute(
      path: '/create_post',
      builder: (context, state) => CreatePostPage(),
    ),
    GoRoute(
      path: '/legecy_home',
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: '/legacy_edit_profile',
      builder: (context, state) => EditProfilePage(),
    ),
     GoRoute(
      path: '/appso_page',
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: '/legecy_take_photo',
      builder: (context, state) => CameraPage(),
    ),
    GoRoute(
      path: '/legecy_captured_video',
      builder: (context, state) => LegecyCaptureVideo(),
    ),
    GoRoute(
      path: '/appso_connection',
      builder: (context, state) => MyConnectionsScreen(),
    ),
    GoRoute(
      path: '/appso_questions',
      builder: (context, state) => InterviewScreen(),
    ),
    GoRoute(
      path: '/appso_questions_video_recording',
      builder: (context, state) => VideoRecorderScreen(question: '',),
    ),
    GoRoute(
      path: '/appso_questions_audio_recording',
      builder: (context, state) => InterviewRecordAudio(question: '',),
    ),
    GoRoute(
      path: '/appso_text_message',
      builder: (context, state) => AppsoMessagePage(),
    ),
    GoRoute(
      path: '/appso_archive_interview',
      builder: (context, state) => ArchiveInterviewScreen(),
    ),
    GoRoute(
      path: '/appso_msg',
      builder: (context, state) => AppsoMessageScreen(),
    ),
    GoRoute(
      path: '/legacy_capsule_media',
      builder: (context, state) => LegacyCapsuleAddMedia(),
    ),
    GoRoute(
      path: '/legacy_capsule_date',
      builder: (context, state) => LegacyAddDate(),
    ),
    GoRoute(
      path: '/legacy_capsule_addnote',
      builder: (context, state) => LegacyCapsuleAddNote(),
    ),
    GoRoute(
      path: '/legacy_capsule_finalview',
      builder: (context, state) => LegacyCapsuleFinalView(),
    ),
    GoRoute(
      path: '/selected_user',
      builder: (context, state) => SelectRecipientScreen(),
    ),
    GoRoute(
      path: '/legacy_live',
      builder: (context, state) => LegacyLivePage(availableCameras: [],),
    ),  
  ],
);

   

    
       
