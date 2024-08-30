import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ride_application/core/config/check_internet.dart';
import 'package:ride_application/core/config/localstorage.dart';
import 'package:ride_application/core/config/theme/theme.dart';
import 'package:ride_application/feature/home/pages/bottom_nav_bar.dart';
import 'package:ride_application/feature/home/pages/home_screen.dart';
import 'package:ride_application/feature/auth/pages/login_screen.dart';
import 'package:ride_application/feature/auth/pages/signup_screen.dart';
import 'package:ride_application/feature/auth/pages/welcome_screen.dart';
import 'package:ride_application/feature/onBoarding/onBoarding.dart';
import 'package:ride_application/feature/profile/pages/change_password.dart';
import 'package:ride_application/feature/profile/pages/policy_screen.dart';
import 'package:ride_application/feature/transport/pages/get_all_bicycle.dart';
import 'package:ride_application/feature/transport/pages/get_cycle.dart';

import 'core/resources/app_string.dart';
import 'feature/auth/bloc/bloc_observer.dart';
import 'feature/share/toast.dart';
import 'feature/transport/pages/select_transport.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initgetit();
  runApp(const MyApp());
}

//eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTMxODI0MTA2IiwiaWF0IjoxNzIzMzc4MjgwLCJleHAiOjE3MjM0NjQ2ODB9.4-AuaKstsxzNJuCJAtLPy6JF4BX5AhL537FsgIy_l9w
//eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTMxODI0MTA2IiwiaWF0IjoxNzIzMjk5Nzg1LCJleHAiOjE3MjMzODYxODV9.h7pWxcKhqHYAuMJUUXtP4n-MXV8l2MREg8YdR6B7Gqs
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initialData();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const BottomNavigationBarr(),
          theme: appTheme,
          routes: {
            'welcome': (context) => const WelcomeScreen(),
            'selectTransport': (context) => const SelectTransport(),
            'getCycle': (context) => const GetCycleScreen(),
            'onboarding': (context) => const OnBoardingScreen(),
            'home': (context) => const HomeScreen(),
            'signup': (context) => const SignUpScreen(),
            'getAllBicycle': (context) => const GetAllBicycleScreen(),
            'bottom': (context) => const BottomNavigationBarr(),
            'login': (context) => const LogInScreen(),
            'changePassword': (context) => const ChangePasswordScreen(),
            'policy': (context) => const PolicyScreen()
          },
        );
      },
    );
  }
}
