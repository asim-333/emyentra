import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/firebase_service.dart';
import 'utils/colors.dart';
import 'routes/app_routes.dart';


/// Splash screen shown on app launch
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  /// Initialize app and check authentication
  Future<void> _initializeApp() async {
    // Wait 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Check if user is logged in
    final firebaseService = FirebaseService();

    if (firebaseService.isLoggedIn) {
      // Go to home
      Get.offAllNamed(AppRoutes.home);
    } else {
      // Go to login
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    'M',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // App Name
              const Text(
                'eMyntra',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 8),

              // Tagline
              Text(
                'Fashion at Your Fingertips',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
