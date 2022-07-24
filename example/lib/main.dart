import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/loading.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const MyApp(),
    }
));
