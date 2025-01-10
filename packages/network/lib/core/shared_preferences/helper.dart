import 'dart:async';
import 'dart:convert';

import 'package:network/core/shared_preferences/preferences.dart';
// import 'package:network/menu_access/data/model/model.dart';

class SharedPreferenceHelper {
  final Preference _sharedPreference;

  const SharedPreferenceHelper(this._sharedPreference);

}

mixin PrefKeys {

}

enum AppLocal { en, ar }
