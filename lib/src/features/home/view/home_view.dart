import 'package:flutter/material.dart';
import 'package:tcc_flutter_app/src/features/home/view/widgets/custom_button.dart';
import 'package:tcc_flutter_app/src/features/home/view/widgets/custom_listtile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      drawer: Drawer(),
      body: ListView(
        children: [
          CustomListTile(
            icon: Icons.settings,
            title: 'Settings',
            subtitle: 'Configurações Gerais',
            destination: '/settings',
          ),
          CustomListTile(
            icon: Icons.person,
            title: 'Profile',
            subtitle: 'Perfil',
            destination: '/tcc',
          ),
          CustomButton(
            altura: 60,
            largura: 120,
            texto: 'Button',
            cor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
