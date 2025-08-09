import 'package:ads_integrated_app/res/components/custom_button.dart';
import 'package:ads_integrated_app/view/screen_four.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../res/components/banner_ad_widget.dart';
import '../utils/ad_helper.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {


  InterstitialAd? _interstitialAd;
  bool _adShown = false;
  int _adAttempts = 0;

  @override
  void initState() {
    super.initState();
    _startSequence();
  }

  void _startSequence() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate splash delay
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _interstitialAd!.setImmersiveMode(true);

          _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _navigateToNextScreen();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _navigateToNextScreen();
            },
          );

          _interstitialAd!.show();
        },
        onAdFailedToLoad: (error) {
          _adAttempts++;
          if (_adAttempts < 2) {
            _loadInterstitialAd(); // Retry
          } else {
            _navigateToNextScreen();
          }
        },
      ),
    );
  }
  void _navigateToNextScreen() {
    if (_adShown) return; // Prevent multiple navigations
    _adShown = true;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ScreenFour()),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Screen Three'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(title: 'Next Screen', onPressed: (){
                          _loadInterstitialAd();
                        })
                      ],
                    ),
                  ),
                ),
              ),
              BannerAdWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
