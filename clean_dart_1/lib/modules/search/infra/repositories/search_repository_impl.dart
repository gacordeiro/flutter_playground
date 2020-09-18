import 'package:clean_dart_1/modules/search/domain/entities/search_exception.dart';
import 'package:clean_dart_1/modules/search/domain/entities/search_result.dart';
import 'package:clean_dart_1/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_dart_1/modules/search/infra/datasources/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource source;

  SearchRepositoryImpl(this.source);

  @override
  Future<Either<SearchException, List<SearchResult>>> search(
      String term) async {
    try {
      final result = await source.getSearch(term);
      return Right(result);
    } on SearchFailedException catch (sfe) {
      return Left(sfe);
    } catch (e) {
      return Left(SearchFailedException());
    }
  }
}
