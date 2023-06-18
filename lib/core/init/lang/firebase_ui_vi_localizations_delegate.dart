import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_ui_vi_localizations.dart';

class FirebaseUIViLocalizationsDelegate
    extends LocalizationsDelegate<FirebaseUILocalizations> {
  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'vi';
  }

  @override
  Future<FirebaseUILocalizations<FirebaseUILocalizationLabels>> load(
    Locale locale,
  ) {
    final flutterFireUILocalizations =
        FirebaseUILocalizations(locale, ViLocalizations());
    return SynchronousFuture<FirebaseUILocalizations>(
      flutterFireUILocalizations,
    );
  }

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<
            FirebaseUILocalizations<FirebaseUILocalizationLabels>>
        old,
  ) {
    return false;
  }
}


