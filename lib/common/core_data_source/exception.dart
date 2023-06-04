class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});
}

class UnAuthorizedException implements Exception {
  const UnAuthorizedException();
}

class UnVerifiedException implements Exception {
  const UnVerifiedException();
}

class DatabaseException implements Exception {
  const DatabaseException();
}
