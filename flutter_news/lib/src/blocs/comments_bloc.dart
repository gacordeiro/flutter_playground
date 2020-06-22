import 'package:flutter/cupertino.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class CommentsBloc {
  final _repository = Repository();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _commentsFetcher = PublishSubject<int>();

  Stream<Map<int, Future<ItemModel>>> get itemWithComments => _commentsOutput.stream;

  Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  CommentsBloc() {
    _commentsFetcher.stream.transform(_commentsTransformer()).pipe(_commentsOutput);
  }

  _commentsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, int index) {
        print("CommentsBloc - ScanStreamTransformer($index) - fetchItem($id)");
        cache[id] = _repository.fetchItem(id);
        cache[id].then((ItemModel item) => item.kids.forEach(fetchItemWithComments));
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  void dispose() {
    _commentsOutput.close();
    _commentsFetcher.close();
  }
}

class CommentsProvider extends InheritedWidget {
  final CommentsBloc bloc;

  CommentsProvider({Key key, Widget child})
      : bloc = CommentsBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CommentsBloc of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<CommentsProvider>().bloc;
}
