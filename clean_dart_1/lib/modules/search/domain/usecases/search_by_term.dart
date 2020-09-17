import 'package:clean_dart_1/modules/search/domain/entities/search_exception.dart';
import 'package:clean_dart_1/modules/search/domain/entities/search_result.dart';
import 'package:clean_dart_1/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SearchByTerm {
  Future<Either<SearchException, List<SearchResult>>> call(String term);
}

class SearchByTermImpl implements SearchByTerm {
  final SearchRepository repository;

  SearchByTermImpl(this.repository);

  @override
  Future<Either<SearchException, List<SearchResult>>> call(String term) async {
    if (term == null || term.isEmpty) return Left(InvalidTermException());
    return repository.search(term);
  }
}
