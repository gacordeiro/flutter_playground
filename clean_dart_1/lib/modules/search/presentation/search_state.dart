import 'package:clean_dart_1/modules/search/domain/entities/search_exception.dart';
import 'package:clean_dart_1/modules/search/domain/entities/search_result.dart';

abstract class SearchState {}

class SearchStateSuccess extends SearchState {
  final List<SearchResult> list;

  SearchStateSuccess(this.list);
}

class SearchStateStart extends SearchState {}

class SearchStateLoading extends SearchState {}

class SearchStateError extends SearchState {
  final SearchException error;

  SearchStateError(this.error);
}
