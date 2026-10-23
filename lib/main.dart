import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/grades_screen.dart';
import 'screens/schedule_screen.dart';
import 'screens/courses_screen.dart';
import 'screens/profile_screen.dart';
import 'providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const FezzanUniversityApp());
}

class FezzanUniversityApp extends StatelessWidget {
  const FezzanUniversityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'جامعة فزان',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.isDarkMode ? _darkTheme() : _lightTheme(),
            initialRoute: '/splash',
            routes: {
              '/splash': (context) => const SplashScreen(),
              '/login': (context) => const LoginScreen(),
              '/home': (context) => const HomeScreen(),
              '/grades': (context) => const GradesScreen(),
              '/schedule': (context) => const ScheduleScreen(),
              '/courses': (context) => const CoursesScreen(),
              '/profile': (context) => const ProfileScreen(),
            },
          );
        },
      ),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF1E3A8A),
      scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      fontFamily: 'SF Pro Display',
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF1E3A8A),
        secondary: Color(0xFF3B82F6),
        surface: Colors.white,
      ),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF3B82F6),
      scaffoldBackgroundColor: const Color(0xFF0F172A),
      fontFamily: 'SF Pro Display',
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF3B82F6),
        secondary: Color(0xFF60A5FA),
        surface: Color(0xFF1E293B),
      ),
    );
  }
}