abstract class SearchException implements Exception {}

class InvalidTermException implements SearchException {}

class SearchFailedException implements SearchException {
  static const defaultMessage = 'Failure on getSearch';
  final String message;

  SearchFailedException({this.message = defaultMessage});
}
