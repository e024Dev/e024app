import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Detail Page'),
        ),
      ),
    );
  }
}
