import 'package:go_router/go_router.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/cursos/view/cursos_view.dart';
import 'package:tcc_flutter_app/src/features/cursos/view/detalhe_curso_view.dart';

final router = GoRouter(
  initialLocation: '/cursos',
  routes: [
    GoRoute(
      path: '/cursos',
      builder: (context, state) => const CursosView(),
      routes: [
        GoRoute(
          path: '/curso',
          builder: (context, state) {
            final curso = state.extra as CursoModel;
            return DetalheCursoView(curso: curso);
          },
        ),
      ],
    ),
  ],
);
