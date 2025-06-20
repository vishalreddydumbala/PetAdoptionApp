class SharedPreferenceKeys {
  // User preferences
  static const String isFirstLaunch = 'is_first_launch';
  static const String isUserLoggedIn = 'is_user_logged_in';
  static const String userId = 'user_id';
  static const String userName = 'user_name';
  static const String userEmail = 'user_email';
  static const String userPhone = 'user_phone';
  static const String userProfileImage = 'user_profile_image';

  // App settings
  static const String isDarkMode = 'is_dark_mode';
  static const String selectedLanguage = 'selected_language';
  static const String notificationsEnabled = 'notifications_enabled';
  static const String locationPermissionGranted = 'location_permission_granted';

  // Pet adoption preferences
  static const String favoriteBreeds = 'favorite_breeds';
  static const String preferredPetType = 'preferred_pet_type';
  static const String maxDistance = 'max_distance';
  static const String priceRange = 'price_range';
  static const String lastSearchLocation = 'last_search_location';

  // App data
  static const String favoritePetIds = 'favorite_pet_ids';
  static const String recentSearches = 'recent_searches';
  static const String adoptionHistory = 'adoption_history';
  static const String lastSyncTime = 'last_sync_time';

  // Onboarding and tutorial
  static const String hasSeenOnboarding = 'has_seen_onboarding';
  static const String tutorialCompleted = 'tutorial_completed';
  static const String tipsShown = 'tips_shown';

  // Cache and performance
  static const String cacheSize = 'cache_size';
  static const String lastCacheCleanup = 'last_cache_cleanup';
  static const String appVersion = 'app_version';
  static const String buildNumber = 'build_number';
}
