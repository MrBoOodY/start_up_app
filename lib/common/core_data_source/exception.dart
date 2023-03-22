class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class UnAuthorizedException implements Exception {
  UnAuthorizedException();
}

class UnVerifiedException implements Exception {
  UnVerifiedException();
}

class DatabaseException implements Exception {
  DatabaseException();
}
