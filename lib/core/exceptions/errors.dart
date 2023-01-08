// Throws on other server errors
class ServerException implements Exception {
  final String message;
  final int statusCode;

  ServerException({required this.message, required this.statusCode});
}

// Throws when data does not exists in cache
class CacheException implements Exception {}

// Throws when some data is not valid
class ValidationException implements Exception {
  final String field;

  ValidationException({required this.field});
}

// Throws when server is not responsive
class SocketException implements Exception {}
