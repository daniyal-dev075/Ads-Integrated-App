import 'dart:io';

class AdHelper{
  static String get interstitialAdUnitId{
    if(Platform.isAndroid){
      return 'ca-app-pub-3940256099942544/1033173712';
    }else {
      throw UnsupportedError('No Ads Available');
    }
  }
  static String get bannerAdUnitId{
    if(Platform.isAndroid){
      return 'ca-app-pub-3940256099942544/6300978111';
    }else {
      throw UnsupportedError('No Ads Available');
    }
  }
  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/9257395921'; // ✅ TEST ID for Android
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }


}