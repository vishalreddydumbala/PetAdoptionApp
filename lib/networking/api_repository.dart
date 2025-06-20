import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:petadoptionapp/networking/api_constant.dart';


class ApiRepository {
  late final Dio _dio;

  ApiRepository() {
    _dio = Dio();
    _setupDio();
  }

  void _setupDio() {
    _dio.options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    // Add interceptors
    _dio.interceptors.add(_getLoggingInterceptor());
    _dio.interceptors.add(_getErrorInterceptor());
  }

  // Logging interceptor for debugging
  Interceptor _getLoggingInterceptor() {
    return LogInterceptor(
      requestBody: kDebugMode,
      responseBody: kDebugMode,
      requestHeader: kDebugMode,
      responseHeader: false,
      error: kDebugMode,
      logPrint: (object) {
        if (kDebugMode) {
          print('API Log: $object');
        }
      },
    );
  }

  // Error interceptor for handling common errors
  Interceptor _getErrorInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) {
        final errorMessage = _handleDioError(error);
        handler.next(DioException(
          requestOptions: error.requestOptions,
          error: errorMessage,
          response: error.response,
          type: error.type,
        ));
      },
    );
  }
  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.badResponse:
        return _handleHttpError(error.response?.statusCode ?? 0, error.response?.data);
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.badCertificate:
        return 'Certificate verification failed.';
      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return 'No internet connection.';
        }
        return 'An unexpected error occurred.';
      default:
        return 'Something went wrong.';
    }
  }

  String _handleHttpError(int statusCode, dynamic responseData) {
    // Try to extract error message from response
    String? apiErrorMessage;
    if (responseData is Map<String, dynamic> && responseData.containsKey('error')) {
      apiErrorMessage = responseData['error'].toString();
    }

    switch (statusCode) {
      case 400:
        return apiErrorMessage ?? 'Bad request. Please check your input.';
      case 404:
        return apiErrorMessage ?? 'Resource not found.';
      case 500:
        return apiErrorMessage ?? 'Server error. Please try again later.';
      default:
        return apiErrorMessage ?? 'HTTP Error: $statusCode';
    }
  }

  // ==================== PET METHODS ====================

  /// Get all pets with optional filtering and pagination
  Future<Response> getPets({
    int page = 1,
    int limit = 10,
    String? search,
    String? breed,
    String? gender,
    int? minAge,
    int? maxAge,
    int? minPrice,
    int? maxPrice,
  }) async {
    final queryParameters = <String, dynamic>{
      'page': page,
      'limit': limit,
    };

    // Add optional parameters only if they are provided
    if (search != null && search.isNotEmpty) {
      queryParameters['search'] = search;
    }
    if (breed != null && breed.isNotEmpty) {
      queryParameters['breed'] = breed;
    }
    if (gender != null && gender.isNotEmpty) {
      queryParameters['gender'] = gender;
    }
    if (minAge != null) {
      queryParameters['minAge'] = minAge;
    }
    if (maxAge != null) {
      queryParameters['maxAge'] = maxAge;
    }
    if (minPrice != null) {
      queryParameters['minPrice'] = minPrice;
    }
    if (maxPrice != null) {
      queryParameters['maxPrice'] = maxPrice;
    }

    return await _dio.get(
      ApiEndpoints.pets,
      queryParameters: queryParameters,
    );
  }

  /// Get pet details by ID
  Future<Response> getPetById(String petId) async {
    return await _dio.get('${ApiEndpoints.petDetails}/$petId');
  }

  /// Adopt a pet by ID
  Future<Response> adoptPet(String petId) async {
    return await _dio.post('${ApiEndpoints.adoptPet}/$petId/adopt');
  }

  /// Toggle favorite status of a pet
  Future<Response> togglePetFavorite(String petId) async {
    return await _dio.post('${ApiEndpoints.toggleFavorite}/$petId/favorite');
  }

  // ==================== CONVENIENCE METHODS ====================

  /// Search pets by name
  Future<Response> searchPets({
    required String query,
    int page = 1,
    int limit = 10,
  }) async {
    return await getPets(
      page: page,
      limit: limit,
      search: query,
    );
  }

  /// Get pets by breed
  Future<Response> getPetsByBreed({
    required String breed,
    int page = 1,
    int limit = 10,
  }) async {
    return await getPets(
      page: page,
      limit: limit,
      breed: breed,
    );
  }

  /// Get pets by gender
  Future<Response> getPetsByGender({
    required String gender,
    int page = 1,
    int limit = 10,
  }) async {
    return await getPets(
      page: page,
      limit: limit,
      gender: gender,
    );
  }

  /// Get pets within age range
  Future<Response> getPetsByAgeRange({
    int? minAge,
    int? maxAge,
    int page = 1,
    int limit = 10,
  }) async {
    return await getPets(
      page: page,
      limit: limit,
      minAge: minAge,
      maxAge: maxAge,
    );
  }

  /// Get pets within price range
  Future<Response> getPetsByPriceRange({
    int? minPrice,
    int? maxPrice,
    int page = 1,
    int limit = 10,
  }) async {
    return await getPets(
      page: page,
      limit: limit,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
  }

  /// Get available pets (not adopted)
  Future<Response> getAvailablePets({
    int page = 1,
    int limit = 10,
  }) async {
    return await getPets(
      page: page,
      limit: limit,
    );
  }
}
