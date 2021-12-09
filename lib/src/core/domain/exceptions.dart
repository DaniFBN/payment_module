class PaymentException implements Exception {
  final String message;

  PaymentException(this.message);
}

class NotFoundException extends PaymentException {
  NotFoundException(String message) : super(message);
}

class EmptyProductsException extends PaymentException {
  EmptyProductsException(String message) : super(message);
}
