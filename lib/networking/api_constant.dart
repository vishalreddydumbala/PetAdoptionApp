class ApiEndpoints {
  // Base URL
  static const String baseUrl = 'http://your-server:3000/api';

  // Pet endpoints
  static const String pets = '/pets';
  static const String petDetails = '/pets'; // + /{id}
  static const String adoptPet = '/pets'; // + /{id}/adopt
  static const String toggleFavorite = '/pets'; // + /{id}/favorite

  // Additional endpoints for future features
  static const String adoptionHistory = '/adoption-history';
  static const String favorites = '/favorites';
}
