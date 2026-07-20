import 'package:go_router/go_router.dart';

import '../screens/phone_screen.dart';
import '../screens/otp_screen.dart';
import '../screens/plan_list_screen.dart';
import '../screens/subscription_status_screen.dart';

/// Central navigation graph: Phone -> OTP -> Plans -> Status.
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'phone',
      builder: (context, state) => const PhoneScreen(),
    ),
    GoRoute(
      path: '/otp',
      name: 'otp',
      builder: (context, state) => const OtpScreen(),
    ),
    GoRoute(
      path: '/plans',
      name: 'plans',
      builder: (context, state) => const PlanListScreen(),
    ),
    GoRoute(
      path: '/status',
      name: 'status',
      builder: (context, state) => const SubscriptionStatusScreen(),
    ),
  ],
);
