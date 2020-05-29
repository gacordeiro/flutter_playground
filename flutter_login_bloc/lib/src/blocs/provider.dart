import 'package:flutter/material.dart';

import 'bloc.dart';

class Provider extends InheritedWidget {
  final _bloc = Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Bloc of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Provider>()._bloc;
}
