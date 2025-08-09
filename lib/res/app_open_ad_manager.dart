import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:developer';

import '../utils/ad_helper.dart';

class AppOpenAdManager {
  static final AppOpenAdManager _instance = AppOpenAdManager._internal();
  factory AppOpenAdManager() => _instance;
  AppOpenAdManager._internal();

  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;

  void loadAd() {
    AppOpenAd.load(
      adUnitId: AdHelper.appOpenAdUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          log('[Ad] App Open Ad loaded');
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          log('[Ad] Failed to load: $error');
          _appOpenAd = null;
        },
      ),
    );
  }
  bool get isAdAvailable => _appOpenAd != null;
  void showAdIfAvailable({VoidCallback? onAdComplete}) {
    if (!isAdAvailable) {
      log('[Ad] No ad to show');
      onAdComplete?.call();
      return;
    }

    if (_isShowingAd) {
      log('[Ad] Already showing');
      return;
    }

    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        log('[Ad] Showing');
      },
      onAdDismissedFullScreenContent: (ad) {
        log('[Ad] Dismissed');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        loadAd(); // preload next ad
        onAdComplete?.call();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        log('[Ad] Failed to show: $error');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        loadAd();
        onAdComplete?.call();
      },
    );
    log('[Ad] Attempting to show the ad now');
    _appOpenAd!.show();
  }
}
