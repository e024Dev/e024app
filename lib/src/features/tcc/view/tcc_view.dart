import 'package:flutter/material.dart';
import 'package:tcc_flutter_app/main.dart';
import 'package:tcc_flutter_app/src/features/tcc/view/cursos_view.dart';

class TccView extends StatefulWidget {
  const TccView({super.key});

  @override
  State<TccView> createState() => _TccViewState();
}

class _TccViewState extends State<TccView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    supabase.from('cursos')
    .select()
    .then((value) {
      print(value);
    });
    return Scaffold(
      appBar: AppBar(title: const Text('TCC')),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          CursosView(),
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
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: 'Cursos',
            selectedIcon: Icon(Icons.school),
          ),
          NavigationDestination(
            icon: Icon(Icons.list_outlined),
            label: 'Objetivos',
            selectedIcon: Icon(Icons.list),
          ),
          NavigationDestination(
            icon: Icon(Icons.code_outlined),
            label: 'Desenvolvimento',
            selectedIcon: Icon(Icons.code),
          ),
          NavigationDestination(
            icon: Icon(Icons.group_outlined),
            label: 'Equipe',
            selectedIcon: Icon(Icons.group),
          ),
        ],
      ),
    );
  }
}
