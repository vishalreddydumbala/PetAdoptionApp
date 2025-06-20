import 'dart:convert';
import 'package:petadoptionapp/const/shared_prefrence/shared_preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceConfig {
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Get SharedPreferences instance
  static SharedPreferences get preferences {
    if (_preferences == null) {
      throw Exception('SharedPreferences not initialized. Call init() first.');
    }
    return _preferences!;
  }

  // ==================== BOOL METHODS ====================

  /// Set boolean value
  static Future<bool> setBool(String key, bool value) async {
    try {
      return await preferences.setBool(key, value);
    } catch (e) {
      print('Error setting bool value for key $key: $e');
      return false;
    }
  }

  /// Get boolean value with default
  static bool getBool(String key, {bool defaultValue = false}) {
    try {
      return preferences.getBool(key) ?? defaultValue;
    } catch (e) {
      print('Error getting bool value for key $key: $e');
      return defaultValue;
    }
  }

  // ==================== STRING METHODS ====================

  /// Set string value
  static Future<bool> setString(String key, String value) async {
    try {
      return await preferences.setString(key, value);
    } catch (e) {
      print('Error setting string value for key $key: $e');
      return false;
    }
  }

  /// Get string value with default
  static String getString(String key, {String defaultValue = ''}) {
    try {
      return preferences.getString(key) ?? defaultValue;
    } catch (e) {
      print('Error getting string value for key $key: $e');
      return defaultValue;
    }
  }

  /// Get nullable string value
  static String? getNullableString(String key) {
    try {
      return preferences.getString(key);
    } catch (e) {
      print('Error getting nullable string value for key $key: $e');
      return null;
    }
  }

  // ==================== INT METHODS ====================

  /// Set integer value
  static Future<bool> setInt(String key, int value) async {
    try {
      return await preferences.setInt(key, value);
    } catch (e) {
      print('Error setting int value for key $key: $e');
      return false;
    }
  }

  /// Get integer value with default
  static int getInt(String key, {int defaultValue = 0}) {
    try {
      return preferences.getInt(key) ?? defaultValue;
    } catch (e) {
      print('Error getting int value for key $key: $e');
      return defaultValue;
    }
  }

  /// Get nullable integer value
  static int? getNullableInt(String key) {
    try {
      return preferences.getInt(key);
    } catch (e) {
      print('Error getting nullable int value for key $key: $e');
      return null;
    }
  }

  // ==================== DOUBLE METHODS ====================

  /// Set double value
  static Future<bool> setDouble(String key, double value) async {
    try {
      return await preferences.setDouble(key, value);
    } catch (e) {
      print('Error setting double value for key $key: $e');
      return false;
    }
  }

  /// Get double value with default
  static double getDouble(String key, {double defaultValue = 0.0}) {
    try {
      return preferences.getDouble(key) ?? defaultValue;
    } catch (e) {
      print('Error getting double value for key $key: $e');
      return defaultValue;
    }
  }

  /// Get nullable double value
  static double? getNullableDouble(String key) {
    try {
      return preferences.getDouble(key);
    } catch (e) {
      print('Error getting nullable double value for key $key: $e');
      return null;
    }
  }

  // ==================== LIST METHODS ====================

  /// Set string list value
  static Future<bool> setStringList(String key, List<String> value) async {
    try {
      return await preferences.setStringList(key, value);
    } catch (e) {
      print('Error setting string list value for key $key: $e');
      return false;
    }
  }

  /// Get string list value with default
  static List<String> getStringList(String key, {List<String>? defaultValue}) {
    try {
      return preferences.getStringList(key) ?? defaultValue ?? <String>[];
    } catch (e) {
      print('Error getting string list value for key $key: $e');
      return defaultValue ?? <String>[];
    }
  }

  // ==================== OBJECT METHODS (JSON) ====================

  /// Set object as JSON string
  static Future<bool> setObject(String key, Map<String, dynamic> value) async {
    try {
      final jsonString = jsonEncode(value);
      return await preferences.setString(key, jsonString);
    } catch (e) {
      print('Error setting object value for key $key: $e');
      return false;
    }
  }

  /// Get object from JSON string
  static Map<String, dynamic>? getObject(String key) {
    try {
      final jsonString = preferences.getString(key);
      if (jsonString == null) return null;
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      print('Error getting object value for key $key: $e');
      return null;
    }
  }

  /// Get object with default value
  static Map<String, dynamic> getObjectWithDefault(
      String key,
      Map<String, dynamic> defaultValue,
      ) {
    return getObject(key) ?? defaultValue;
  }

  // ==================== UTILITY METHODS ====================

  /// Check if key exists
  static bool containsKey(String key) {
    try {
      return preferences.containsKey(key);
    } catch (e) {
      print('Error checking if key exists $key: $e');
      return false;
    }
  }

  /// Remove specific key
  static Future<bool> remove(String key) async {
    try {
      return await preferences.remove(key);
    } catch (e) {
      print('Error removing key $key: $e');
      return false;
    }
  }

  /// Clear all preferences
  static Future<bool> clear() async {
    try {
      return await preferences.clear();
    } catch (e) {
      print('Error clearing all preferences: $e');
      return false;
    }
  }

  /// Get all keys
  static Set<String> getAllKeys() {
    try {
      return preferences.getKeys();
    } catch (e) {
      print('Error getting all keys: $e');
      return <String>{};
    }
  }

  /// Reload preferences from disk
  static Future<void> reload() async {
    try {
      await preferences.reload();
    } catch (e) {
      print('Error reloading preferences: $e');
    }
  }

  // ==================== APP-SPECIFIC HELPER METHODS ====================

  /// User authentication helpers
  static Future<bool> setUserLoggedIn(bool isLoggedIn) async {
    return await setBool(SharedPreferenceKeys.isUserLoggedIn, isLoggedIn);
  }

  static bool isUserLoggedIn() {
    return getBool(SharedPreferenceKeys.isUserLoggedIn, defaultValue: false);
  }

  /// User data helpers
  static Future<bool> setUserData({
    required String userId,
    required String userName,
    required String userEmail,
    String? userPhone,
    String? profileImage,
  }) async {
    final results = await Future.wait([
      setString(SharedPreferenceKeys.userId, userId),
      setString(SharedPreferenceKeys.userName, userName),
      setString(SharedPreferenceKeys.userEmail, userEmail),
      if (userPhone != null) setString(SharedPreferenceKeys.userPhone, userPhone),
      if (profileImage != null) setString(SharedPreferenceKeys.userProfileImage, profileImage),
    ]);

    return results.every((result) => result);
  }

  static Map<String, String?> getUserData() {
    return {
      'userId': getNullableString(SharedPreferenceKeys.userId),
      'userName': getNullableString(SharedPreferenceKeys.userName),
      'userEmail': getNullableString(SharedPreferenceKeys.userEmail),
      'userPhone': getNullableString(SharedPreferenceKeys.userPhone),
      'profileImage': getNullableString(SharedPreferenceKeys.userProfileImage),
    };
  }

  /// App settings helpers
  static Future<bool> setDarkMode(bool isDarkMode) async {
    return setBool(SharedPreferenceKeys.isDarkMode, isDarkMode);
  }

  static bool isDarkMode() {
    return getBool(SharedPreferenceKeys.isDarkMode, defaultValue: false);
  }

  static Future<bool> setNotificationsEnabled(bool enabled) async {
    return setBool(SharedPreferenceKeys.notificationsEnabled, enabled);
  }

  static bool areNotificationsEnabled() {
    return getBool(SharedPreferenceKeys.notificationsEnabled, defaultValue: true);
  }

  /// Pet preferences helpers
  static Future<bool> setFavoritePetIds(List<String> petIds) async {
    return setStringList(SharedPreferenceKeys.favoritePetIds, petIds);
  }

  static List<String> getFavoritePetIds() {
    return getStringList(SharedPreferenceKeys.favoritePetIds);
  }

  static Future<bool> addFavoritePetId(String petId) async {
    final currentFavorites = getFavoritePetIds();
    if (!currentFavorites.contains(petId)) {
      currentFavorites.add(petId);
      return setFavoritePetIds(currentFavorites);
    }
    return true;
  }

  static Future<bool> removeFavoritePetId(String petId) async {
    final currentFavorites = getFavoritePetIds();
    if (currentFavorites.contains(petId)) {
      currentFavorites.remove(petId);
      return setFavoritePetIds(currentFavorites);
    }
    return true;
  }

  /// Onboarding helpers
  static Future<bool> setOnboardingCompleted(bool completed) async {
    return setBool(SharedPreferenceKeys.hasSeenOnboarding, completed);
  }

  static bool hasSeenOnboarding() {
    return getBool(SharedPreferenceKeys.hasSeenOnboarding, defaultValue: false);
  }

  /// First launch helper
  static Future<bool> setFirstLaunch(bool isFirstLaunch) async {
    return setBool(SharedPreferenceKeys.isFirstLaunch, isFirstLaunch);
  }

  static bool isFirstLaunch() {
    return getBool(SharedPreferenceKeys.isFirstLaunch, defaultValue: true);
  }
}
