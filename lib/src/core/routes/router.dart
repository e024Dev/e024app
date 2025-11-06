import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_flutter_app/src/core/ui/widgets/navigation_shell_route.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/cursos/view/cursos_view.dart';
import 'package:tcc_flutter_app/src/features/cursos/view/detalhe_curso_view.dart';

final router = GoRouter(
  initialLocation: '/cursos',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNavigationShell(shell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) =>
                  Container(color: Colors.red.shade100),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/projetos',
              builder: (context, state) =>
                  Container(color: Colors.green.shade100),
            ),
          ],
        ),
        StatefulShellBranch(
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
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/eventos',
              builder: (context, state) =>
                  Container(color: Colors.blue.shade100),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/vestibulinho',
              builder: (context, state) =>
                  Container(color: Colors.yellow.shade100),
            ),
          ],
        ),
      ],
    ),
  ],
);
