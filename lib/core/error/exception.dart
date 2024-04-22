class GeneralException implements Exception {
  final String message;
  const GeneralException({required this.message});
}

class StatusCodeException implements Exception {
  final String message;
  const StatusCodeException({required this.message});
}

// class ConnectionException implements Exception {
//   final String message;
//   const ConnectionException({required this.message});
// }
