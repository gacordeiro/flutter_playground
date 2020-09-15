import 'package:mobx/mobx.dart';
import 'package:mobx_test/models/item_model.dart';
import 'package:rxdart/rxdart.dart';

part 'stream_list_controller.g.dart';

class StreamListController = _StreamListController with _$StreamListController;

abstract class _StreamListController with Store {
  final _listItems = BehaviorSubject<List<ItemModel>>.seeded([]);
  final _filter = BehaviorSubject<String>.seeded('');

  ObservableStream<List<ItemModel>> output;

  _StreamListController() {
    output = Rx.combineLatest2<List<ItemModel>, String, List<ItemModel>>(
      _listItems.stream,
      _filter.stream,
      (list, filter) => filter.isEmpty
          ? list
          : list.where((item) {
              return item.title.toLowerCase().contains(filter.toLowerCase());
            }).toList(),
    ).asObservable(initialValue: []);
  }

  @computed
  int get totalChecked => output.value.where((item) => item.check).length;

  @action
  void setFilter(String value) => _filter.add(value);

  @action
  void addItem(ItemModel model) {
    var list = List<ItemModel>.from(_listItems.value);
    list.add(model);
    _listItems.add(list);
  }

  @action
  void removeItem(ItemModel model) {
    var list = List<ItemModel>.from(_listItems.value);
    list.removeWhere((item) => item.title == model.title);
    _listItems.add(list);
  }
}
