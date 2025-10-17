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
            var cursos = snapshot.data;
            return ListView.builder(
              itemCount: cursos!.length,
              itemBuilder: (context, index) {
                final curso = cursos[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(curso['id']!.toString()),
                    ),
                    title: Text(curso['nome']!),
                    subtitle: Text(curso['descricao']!),
                  ),
                );
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
