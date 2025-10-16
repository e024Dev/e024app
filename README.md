# tcc_flutter_app

## Ajustar o main.dart

```dart
import 'package:flutter/material.dart';
import 'package:tcc_flutter_app/src/app.dart';

void main() {
  runApp(const App());
}
```

## Ajustar o app.dart

```dart
import 'package:flutter/material.dart';
import 'package:tcc_flutter_app/src/features/home/view/home_view.dart';
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
      },
    );
  }
}
```

## Ajustar o tcc_view.dart

```dart
import 'package:flutter/material.dart';

class TccView extends StatefulWidget {
  const TccView({super.key});

  @override
  State<TccView> createState() => _TccViewState();
}

class _TccViewState extends State<TccView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TCC')),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Center(child: Text('Resumo')),
          Center(child: Text('Objetivos')),
          Center(child: Text('Desenvolvimento')),
          Center(child: Text('Equipe')),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.subject_outlined), label: 'Resumo', selectedIcon: Icon(Icons.subject)),
          NavigationDestination(icon: Icon(Icons.list_outlined), label: 'Objetivos', selectedIcon: Icon(Icons.list)),
          NavigationDestination(icon: Icon(Icons.code_outlined), label: 'Desenvolvimento', selectedIcon: Icon(Icons.code)),
          NavigationDestination(icon: Icon(Icons.group_outlined), label: 'Equipe', selectedIcon: Icon(Icons.group)),
        ],
      ),
    );
  }
} 
```

