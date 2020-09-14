import 'package:mobx/mobx.dart';

part 'item_model.g.dart';

class ItemModel = _ItemModel with _$ItemModel;

abstract class _ItemModel with Store {
  _ItemModel({this.title, this.check});

  @observable
  String title;

  @action
  void setTitle(String value) => title = value;

  @observable
  bool check;

  @action
  void setCheck(bool value) => check = value;
}
