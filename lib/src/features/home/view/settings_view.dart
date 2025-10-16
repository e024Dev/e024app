import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Account', icon: Icon(Icons.person)),
              Tab(text: 'Notifications', icon: Icon(Icons.notifications)),
              Tab(text: 'Data & Storage', icon: Icon(Icons.storage)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(color: Colors.red.shade200),
            Container(color: Colors.green.shade200),
            Container(color: Colors.blue.shade200),
          ],
        ),
      ),
    );
  }
}
