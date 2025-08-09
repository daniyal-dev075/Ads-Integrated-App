import 'dart:developer';

import 'package:ads_integrated_app/view/login_view.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../res/app_open_ad_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // Load the ad
    AppOpenAdManager().loadAd();

    // After 3 seconds, show ad if ready, else navigate directly
    Future.delayed(const Duration(seconds: 3), () {
      log('[Splash] Checking if ad is ready to show...');
      if (AppOpenAdManager().isAdAvailable) {
        log('[Splash] Ad is ready. Showing...');
        AppOpenAdManager().showAdIfAvailable(onAdComplete: _navigateToHome);
      } else {
        log('[Splash] Ad not ready. Navigating directly.');
        _navigateToHome();
      }
    });
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spin(
            duration: const Duration(milliseconds: 3000),
            child: Center(
              child: Image.asset(
                'images/admob_logo.png',
                height: 400,
                width: 400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
