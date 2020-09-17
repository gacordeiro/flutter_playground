import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_test3/app/modules/start/pages/config/config_page.dart';
import 'package:slidy_test3/app/modules/start/pages/profile/profile_page.dart';
import 'package:slidy_test3/app/modules/start/submodules/home/home_module.dart';

import 'start_controller.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, StartController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pvc,
        children: [
          RouterOutlet(module: HomeModule()),
          ConfigPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controller.pvc,
        builder: (context, snapshot) => BottomNavigationBar(
          currentIndex: controller.pvc?.page?.round() ?? 0,
          onTap: (index) => controller.pvc.jumpToPage(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Config',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
