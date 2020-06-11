import 'package:flutter/material.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _itemsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _itemsFetcher = PublishSubject<int>();

  Stream<List<int>> get topIds => _topIds.stream;

  Stream<Map<int, Future<ItemModel>>> get items => _itemsOutput.stream;

  Function(int) get fetchItem => _itemsFetcher.sink.add;

  StoriesBloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, int index) {
        print("ScanStreamTransformer($index) - fetchItem($id)");
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  void dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}

class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  StoriesProvider({Key key, Widget child})
      : bloc = StoriesBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static StoriesBloc of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<StoriesProvider>().bloc;
}
