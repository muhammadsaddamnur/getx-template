///model for any exception
///
class ModelException implements Exception {
  final _message;
  final _prefix;

  ModelException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends ModelException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends ModelException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends ModelException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends ModelException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class ForbiddenException extends ModelException {
  ForbiddenException([String? message]) : super(message, "Forbidden: ");
}

class NotFoundException extends ModelException {
  NotFoundException([String? message]) : super(message, "Not Found: ");
}

class InternalServerException extends ModelException {
  InternalServerException([String? message])
      : super(message, "Internal Server Error: ");
}

class BadGatewayException extends ModelException {
  BadGatewayException([String? message]) : super(message, "Bad Gateway: ");
}

class ServiceUnvailableException extends ModelException {
  ServiceUnvailableException([String? message])
      : super(message, "Service Unvailable: ");
}
