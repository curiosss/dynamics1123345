abstract class KError {
  String message;
  KError({this.message = "Error"});
}

class ParseError extends KError {
  ParseError() : super(message: "Parse error");
}

class NetworkError extends KError {
  NetworkError() : super(message: "Network error");
}
