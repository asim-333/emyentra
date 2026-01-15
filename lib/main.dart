// Import Flutter material widgets
import 'package:flutter/material.dart';

// Import GetX for navigation
import 'package:get/get.dart';

// Import Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Import our screens
import 'splash_screen.dart';
import 'routes/app_routes.dart';
import 'utils/colors.dart';

// Main function - app starts here
void main() async {
  // Initialize Flutter
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(const MyApp());
}

// Main app class
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // App name
      title: 'eMyntra',

      // Remove debug banner
      debugShowCheckedModeBanner: false,

      // App theme
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),

      // First screen
      home: const SplashScreen(),

      // All routes
      getPages: AppRoutes.routes,
    );
  }
}
