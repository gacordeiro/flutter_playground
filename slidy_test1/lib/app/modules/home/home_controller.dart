import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _Base with _$HomeController;

abstract class _Base with Store {
  String text = '';
}
