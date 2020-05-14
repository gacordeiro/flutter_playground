import 'package:flutter/material.dart';

import 'database.dart';
import 'login.dart';
import 'randomwords.dart';
import 'splash.dart';

final routes = {
  '/saved_words': (BuildContext context) => new SavedWords(),
  '/home': (BuildContext context) => new RandomWords(key: randomWordsKey),
  '/database': (BuildContext context) => new DatabaseScreen(),
  '/login': (BuildContext context) => new LoginScreen(),
  '/': (BuildContext context) => new SplashScreen(),
};
