class ApiErrors {
  ApiErrors._();

  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError =
      "You do not have permission to access this resource.";
  static const String unauthorizedError = "Unauthenticated.";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";

  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";

  static const String notActiveMessage = "Your account is not active";
  static const String notSubscribedMessage =
      "You are not subscribed to this service.";

  static const String ok = "Ok";
}
