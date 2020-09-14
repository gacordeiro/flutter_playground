import 'package:mobx/mobx.dart';
import 'package:mobx_test/models/item_model.dart';

part 'list_controller.g.dart';

class ListController = _ListController with _$ListController;

abstract class _ListController with Store {
  @observable
  ObservableList<ItemModel> listItems = [
    ItemModel(title: "Item 1", check: true),
    ItemModel(title: "Item 2", check: false),
    ItemModel(title: "Item 3", check: false),
  ].asObservable();

  @computed
  int get totalChecked => filteredList.where((item) => item.check ?? false).length;

  @action
  void addItem(ItemModel model) {
    listItems.add(model);
  }

  @action
  void removeItem(ItemModel model) {
    listItems.removeWhere((item) => item.title == model.title);
  }

  @observable
  String filter = '';

  @action
  void setFilter(String value) => filter = value;

  @computed
  List<ItemModel> get filteredList {
    if (filter.isEmpty)
      return listItems;
    else
      return listItems
          .where(
            (item) => item.title.toLowerCase().contains(filter.toLowerCase()),
          )
          .toList();
  }
}
