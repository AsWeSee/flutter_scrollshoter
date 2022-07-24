import 'package:example/pages/home.dart';
import 'package:example/pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => MyApp(),
    }
));
