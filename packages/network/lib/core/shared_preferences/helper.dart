import 'dart:async';
import 'dart:convert';

import 'package:network/core/shared_preferences/preferences.dart';
// import 'package:network/menu_access/data/model/model.dart';

class SharedPreferenceHelper {
  final Preference _sharedPreference;

  const SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------

  Future<void> saveSubUserId(int subUserId) async {
    await _sharedPreference.setInt(PrefKeys.subUserId, subUserId);
  }

  int? get subUserId {
    return _sharedPreference.getInt(PrefKeys.subUserId);
  }

  Future<void> saveCompanyId(int companyId) async {
    await _sharedPreference.setInt(PrefKeys.companyId, companyId);
  }

  int? get companyId {
    return _sharedPreference.getInt(PrefKeys.companyId);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(PrefKeys.authToken);
  }

  Future<void> saveIsLoggedIn(bool value) async {
    await _sharedPreference.setBool(PrefKeys.isLoggedIn, value);
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  Future<void> saveIsRememberMe(bool value) async {
    await _sharedPreference.setBool(PrefKeys.rememberMe, value);
  }

  bool get rememberMe {
    return _sharedPreference.getBool(PrefKeys.rememberMe) ?? false;
  }

  Future<void> saveIsGroupLogin(bool value) async {
    await _sharedPreference.setBool(PrefKeys.isGroupLogin, value);
  }

  bool get isGroupLogin {
    return _sharedPreference.getBool(PrefKeys.isGroupLogin) ?? false;
  }

  Future<void> clear() async {
    await _sharedPreference.clear();
  }
  Future<void> saveUserName(String userName) async {
    await _sharedPreference.setString(PrefKeys.userName, userName);
  }

  String? get userName {
    return _sharedPreference.getString(PrefKeys.userName);
  }

  Future<void> saveUserNameResponse(String userNameResponse) async {
    await _sharedPreference.setString(PrefKeys.userNameResponse, userNameResponse);
  }

  String? get userNameResponse {
    return _sharedPreference.getString(PrefKeys.userNameResponse);
  }

  Future<void> savePassword(String password) async {
    await _sharedPreference.setString(PrefKeys.password, password);
  }

  String? get password {
    return _sharedPreference.getString(PrefKeys.password);
  }

  Future<void> saveProductData(String productData) async {
    await _sharedPreference.setString(PrefKeys.productData, productData);
  }

  String? get productData {
    return _sharedPreference.getString(PrefKeys.productData);
  }

  // Future<void> saveMenuAccess(MenuAccessData data) async {
  //   await _sharedPreference.setString(PrefKeys.menuAccess, json.encode(data.toJson()));
  // }

  String? get menuAccess {
    return _sharedPreference.getString(PrefKeys.menuAccess);
  }

  Future<void> saveLoginType(String loginType) async {
    await _sharedPreference.setString(PrefKeys.loginType, loginType);
  }

  String? get loginType {
    return _sharedPreference.getString(PrefKeys.loginType);
  }

  Future<void> saveProductId(int productId) async {
    await _sharedPreference.setInt(PrefKeys.productId, productId);
  }

  int? get productId {
    return _sharedPreference.getInt(PrefKeys.productId);
  }

  Future<void> saveFuelName(String fuelName) async {
    await _sharedPreference.setString(PrefKeys.fuelName, fuelName);
  }

  String? get fuelName {
    return _sharedPreference.getString(PrefKeys.fuelName);
  }


  Future<void> saveIsDual(bool isDual) async {
    await _sharedPreference.setBool(PrefKeys.isDual, isDual);
  }

  bool? get isDual {
    return _sharedPreference.getBool(PrefKeys.isDual);
  }

  Future<void> saveDialDigitElec(String dialDigitElec) async {
    await _sharedPreference.setString(PrefKeys.dialDigitElec, dialDigitElec);
  }

  String? get dialDigitElec {
    return _sharedPreference.getString(PrefKeys.dialDigitElec);
  }

  Future<void> saveDialDigitGas(String dialDigitGas) async {
    await _sharedPreference.setString(PrefKeys.dialDigitGas, dialDigitGas);
  }

  String? get dialDigitGas {
    return _sharedPreference.getString(PrefKeys.dialDigitGas);
  }

  Future<void> saveGroupName(String groupName) async {
    await _sharedPreference.setString(PrefKeys.groupName, groupName);
  }

  String? get groupName {
    return _sharedPreference.getString(PrefKeys.groupName);
  }

  Future<void> saveIsHH(bool isHH) async {
    await _sharedPreference.setBool(PrefKeys.isHH, isHH);
  }

  bool? get isHH {
    return _sharedPreference.getBool(PrefKeys.isHH);
  }

  Future<void> saveCustomerId(int customerId) async {
    await _sharedPreference.setInt(PrefKeys.customerId, customerId);
  }

  int? get customerId {
    return _sharedPreference.getInt(PrefKeys.customerId);
  }

  Future<void> saveAuthToken(String authToken) async {
    await _sharedPreference.setString(PrefKeys.authToken, authToken);
  }

  String? get authToken {
    return _sharedPreference.getString(PrefKeys.authToken);
  }

  Future<void> saveModifyId(int modifyId) async {
    await _sharedPreference.setInt(PrefKeys.modifyId, modifyId);
  }

  int? get modifyId {
    return _sharedPreference.getInt(PrefKeys.modifyId);
  }

}

mixin PrefKeys {
  static const String isLoggedIn = "isLoggedIn";
  static const String languageCode = 'languageCode';
  static const String isGroupLogin = 'isGroupLogin';
  static const String userName = 'userName';
  static const String password = 'password';
  static const String productData = 'productData';
  static const String menuAccess = 'menuAccess';
  static const String loginType = 'loginType';
  static const String productId = 'productId';
  static const String fuelName = 'fuelName';
  static const String isDual = 'isDual';
  static const String dialDigitElec = 'dialDigitElec';
  static const String dialDigitGas = 'dialDigitGas';
  static const String companyId = 'companyId';
  static const String groupName = 'groupName';
  static const String userNameResponse = 'userNameResponse';
  static const String isHH = 'isHH';
  static const String subUserId = 'subUserId';
  static const String customerId = 'customerId';
  static const String authToken = "authToken";
  static const String modifyId = "modifyId";
  static const String rememberMe = "rememberMe";
}

enum AppLocal { en, ar }
