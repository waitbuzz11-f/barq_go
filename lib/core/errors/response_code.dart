class ResponseCode {
  ResponseCode._();

  // Success
  static const int success = 200;
  static const int created = 201;

  // Server
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int validationError = 422;
  static const int internalServerError = 500;

  // Local
  static const int connectTimeout = -1;
  static const int sendTimeout = -2;
  static const int receiveTimeout = -3;
  static const int cancel = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int unknown = -7;
}
