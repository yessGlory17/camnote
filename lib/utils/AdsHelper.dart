import 'dart:io';

import 'package:camnote/state/ThemeChanger.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class AdsHelper {
  RewardedAd? rewardedAd;
  BannerAd? bannerAd;

  static initialization() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1858497664550196/6943876518";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get nativeAdUnitId {
    if (Platform.isAndroid) {
      return "<YOUR_ANDROID_NATIVE_AD_UNIT_ID>";
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_NATIVE_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1858497664550196/5292441972";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnit {
    if (Platform.isAndroid) {
      return "ca-app-pub-1858497664550196/8896194385"; //Şu Anda Test Reklamı
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  //Load Functions

  void loadBannerAd() {
    this.bannerAd = BannerAd(
        adUnitId: AdsHelper.bannerAdUnitId,
        request: AdRequest(),
        size: AdSize.banner,
        listener: BannerAdListener(
            onAdLoaded: (_) {},
            onAdFailedToLoad: (_, error) {
              print("Banner Reklam Hatası : " + error.toString());
            }));
  }

  void loadRewardedAd(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context, listen: false);

    RewardedAd.load(
        adUnitId: AdsHelper.rewardedAdUnit,
        request: AdRequest(),
        rewardedAdLoadCallback:
            RewardedAdLoadCallback(onAdLoaded: (RewardedAd ad) {
          //this.rewardedAd = ad;
          //theme.setTheme(themeData);
          ad.show(onUserEarnedReward: (RewardedAd ad, RewardItem item) {
            print("Reward Earned is ${item.amount}");
          });

          ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdShowedFullScreenContent: (RewardedAd ad) {},
              onAdFailedToShowFullScreenContent:
                  (RewardedAd ad, AdError error) {
                ad.dispose();
              },
              onAdDismissedFullScreenContent: (RewardedAd ad) {
                ad.dispose();
              },
              onAdImpression: (RewardedAd rewardedAd) {
                print("Reklama Tıklandı ${rewardedAd}");
              });
        }, onAdFailedToLoad: (LoadAdError error) {
          print("Ödüllü Reklam Hatası : " + error.toString());
        }));
  }

  void showRewardAd() {
    rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem item) {
      print("Reward Earned is ${item.amount}");
    });

    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedAd ad) {},
        onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
          ad.dispose();
        },
        onAdDismissedFullScreenContent: (RewardedAd ad) {
          ad.dispose();
        },
        onAdImpression: (RewardedAd rewardedAd) {
          print("Reklama Tıklandı ${rewardedAd}");
        });
  }
}
