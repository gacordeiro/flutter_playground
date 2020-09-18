import 'package:clean_dart_1/modules/search/domain/entities/search_exception.dart';
import 'package:clean_dart_1/modules/search/domain/entities/search_result.dart';
import 'package:clean_dart_1/modules/search/domain/usecases/search_by_term.dart';
import 'package:clean_dart_1/modules/search/presentation/search_bloc.dart';
import 'package:clean_dart_1/modules/search/presentation/search_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchByTermMock extends Mock implements SearchByTerm {}

main() {
  final usecase = SearchByTermMock();
  final bloc = SearchBloc(usecase);

  tearDownAll(() {
    bloc.close();
  });

  test('Check states are emitted on the correct order for success', () {
    when(usecase(any)).thenAnswer((i) async => Right(<SearchResult>[]));
    expect(
      bloc,
      emitsInOrder([
        isA<SearchStateLoading>(),
        isA<SearchStateSuccess>(),
      ]),
    );
    bloc.add('term');
  });

  test('Check states are emitted on the correct order for error', () {
    when(usecase(any)).thenAnswer((i) async => Left(InvalidTermException()));
    expect(
      bloc,
      emitsInOrder([
        isA<SearchStateLoading>(),
        isA<SearchStateError>(),
      ]),
    );
    bloc.add('term');
  });
}
