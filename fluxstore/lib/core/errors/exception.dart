class ServerException implements Exception {
  final String message;
  ServerException(this.message);

  @override
  String toString() => 'ServerException: $message';
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException(this.message);

  @override
  String toString() => 'UnauthorizedException: $message';
}

class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);

  @override
  String toString() => 'BadRequestException: $message';
}
