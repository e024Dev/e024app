import 'package:flutter/material.dart';
import 'package:tcc_flutter_app/src/features/home/view/settings_view.dart';
import 'package:tcc_flutter_app/src/features/tcc/view/tcc_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TccView(),
        '/tcc': (context) => TccView(),
        '/settings': (context) => SettingsView(),
      },
    );
  }
}
