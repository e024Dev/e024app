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