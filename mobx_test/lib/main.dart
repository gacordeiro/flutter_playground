import 'package:flutter/material.dart';
import 'package:mobx_test/controllers/client_controller.dart';
import 'package:mobx_test/screens/client_page.dart';
import 'package:mobx_test/screens/counter_page.dart';
import 'package:mobx_test/screens/list_page.dart';
import 'package:mobx_test/screens/reaction_counter_page.dart';
import 'package:mobx_test/screens/stream_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ClientController>(
          create: (_) => ClientController(),
          dispose: (_, controller) => controller.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'reaction',
        routes: {
          'client': (_) => ClientPage(),
          'counter': (_) => CounterPage(),
          'reaction': (_) => ReactionCounterPage(),
          'list': (_) => ListPage(),
          'stream': (_) => StreamListPage(),
        },
      ),
    );
  }
}
