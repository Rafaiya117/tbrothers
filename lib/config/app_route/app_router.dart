import 'package:appsoleum/features/auths/complete_profile/view/complete_profile_view.dart';
import 'package:appsoleum/features/auths/complete_profile/view/completed_last_profile.dart';
import 'package:appsoleum/features/auths/complete_profile/view/profile_image_upload.dart';
import 'package:appsoleum/features/auths/complete_profile/view/profile_video_uploader.dart';
import 'package:appsoleum/features/auths/forgot_password/view/forgot_password_view.dart';
import 'package:appsoleum/features/auths/login/view/login_view.dart';
import 'package:appsoleum/features/auths/reset_password/view/reset_password.dart';
import 'package:appsoleum/features/auths/signup/view/signup_view.dart';
import 'package:appsoleum/features/auths/verify_otp/view/verify_otp.dart';
import 'package:appsoleum/features/home_page/view/home_page_view.dart';
import 'package:appsoleum/features/landding/view/landing_page.dart';
import 'package:appsoleum/features/onboarding_one/view/onboarding_one_view.dart';
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
  ],
);

   

    
       
