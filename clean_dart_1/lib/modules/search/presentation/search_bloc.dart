import 'package:bloc/bloc.dart';
import 'package:clean_dart_1/modules/search/domain/usecases/search_by_term.dart';
import 'package:clean_dart_1/modules/search/presentation/search_state.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc<String, SearchState> {
  final SearchByTerm searchByTerm;

  SearchBloc(this.searchByTerm) : super(SearchStateStart());

  @override
  Stream<SearchState> mapEventToState(String term) async* {
    yield SearchStateLoading();
    final result = await searchByTerm(term);
    yield result.fold(
      (error) => SearchStateError(error),
      (list) => SearchStateSuccess(list),
    );
  }

  @override
  Stream<Transition<String, SearchState>> transformEvents(
    Stream<String> events,
    TransitionFunction<String, SearchState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(Duration(milliseconds: 600)),
      transitionFn,
    );
  }
}
