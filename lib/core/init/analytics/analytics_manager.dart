import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';

class AnalyticsManager {
  AnalyticsManager._init() {
    init();
  }
  static final AnalyticsManager _instance = AnalyticsManager._init();
  static AnalyticsManager get instance => _instance;

  static final _analytics = FirebaseAnalytics.instance;

  final List<NavigatorObserver> observer =
      ApplicationConstants.TEST_MODE ? [] : [FirebaseAnalyticsObserver(analytics: _analytics)];

  // Firebase e her zaman veri göndermek istemeyebiliriz.
  // Örneğin inapppurchase yapacağımızda ApplicationConstants.TEST_MODE false olursa
  // gerçekten ödeme yapılmış gibi ücret bilgisi yansır.
  // Bu istenmeyen bir durumdur, gerçek verileri manipüle eder..
  Future<void> init() async {
    await _analytics.setAnalyticsCollectionEnabled(ApplicationConstants.TEST_MODE ? false : true);
  }

  Future<void> customEvent(String name) async {
    //her şey yapılabilir
    await _analytics.logEvent(name: name);
  }

  //USER ANALYTICS
  //kayıt sırasında user ıd yi almak için
  Future setUserAnalytics({String? userID, String? name, String? value}) async {
    await _analytics.setUserId(id: userID);

    if (name != null && value != null) {
      await _analytics.setUserProperty(name: name, value: value);
    }
  }

  Future<void> userLogin(String signUpMethod) async {
    await _analytics.logLogin(loginMethod: signUpMethod);
  }

  Future<void> userSignUp(String signUpMethod) async {
    await _analytics.logSignUp(signUpMethod: signUpMethod);
  }
}
