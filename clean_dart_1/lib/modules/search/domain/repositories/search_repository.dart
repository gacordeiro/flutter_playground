import 'package:clean_dart_1/modules/search/domain/entities/search_exception.dart';
import 'package:clean_dart_1/modules/search/domain/entities/search_result.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<SearchException, List<SearchResult>>> search(String term);
}
