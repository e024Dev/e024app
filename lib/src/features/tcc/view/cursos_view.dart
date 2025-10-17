import 'package:flutter/material.dart';
import 'package:tcc_flutter_app/main.dart';

class CursosView extends StatefulWidget {
  const CursosView({super.key});

  @override
  State<CursosView> createState() => _CursosViewState();
}

class _CursosViewState extends State<CursosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: supabase.from('cursos').select(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            return Text(snapshot.data.toString());
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
