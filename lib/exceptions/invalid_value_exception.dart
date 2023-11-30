class InvalidValueException implements Exception {
  String error() => "Valor inválido";

  @override
  String toString() {
    return "InvalidValueException: ${error()}";
  }
}
