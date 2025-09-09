import 'package:appsoleum/features/auths/view/login_view.dart';
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
  ],
);

   

    
       
