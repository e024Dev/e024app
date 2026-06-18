# TCShelf

Aplicativo biblioteca digital de TCCs e divulgação de cursos da Etec Prefeito Alberto Feres.

## Stack

- **Supabase** — Banco de dados e API
- **Riverpod** — Gerenciamento de estado
- **Freezed** — Modelos imutáveis com geração de código
- **GoRouter** — Navegação com bottom navigation
- **Google Maps** — Mapa com geolocalização
- **build_runner** — Geração de código

## Setup

Crie o arquivo `.env` na raiz (não versionado):

```
SUPABASE_URL=sua_url
SUPABASE_ANON_KEY=sua_chave
```

Instale as dependências e gere os arquivos de código:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

> Rode o build_runner sempre que alterar modelos `@freezed` ou providers `@riverpod`.

## Arquitetura

MVVM com pastas organizadas por funcionalidade (feature) em `lib/src/features/`:

```
lib/
├── main.dart                    # Entrada do app
├── src/
│   ├── app.dart                 # Widget raiz (MaterialApp.router)
│   ├── core/
│   │   ├── providers/           # Providers globais
│   │   ├── routes/              # Configuração do GoRouter
│   │   └── ui/widgets/          # Widgets compartilhados
│   └── features/
│       ├── home/                # Tela inicial
│       │   ├── model/           # (se houver)
│       │   ├── view/            # HomeView, widgets
│       │   └── viewmodel/       # (se houver)
│       ├── cursos/              # Cursos da Etec
│       │   ├── model/           # CursoModel, repository
│       │   ├── view/            # CursosView, DetalheCursoView
│       │   └── viewmodel/       # CursosViewModel
│       ├── projetos/            # Projetos (TCCs)
│       │   ├── model/           # ProjetoModel, AlunoModel, repositories
│       │   ├── view/            # ProjetosView, ProjetoDetalheView
│       │   └── viewmodel/       # ProjetosViewModel
│       ├── mapa/                # Mapa com prestadores próximos
│       ├── vestibulinho/        # Cursos com processo seletivo
│       └── counter/             # Exemplo simples de Riverpod
```

Cada feature segue:

| Camada | Finalidade | Tecnologia |
|--------|-----------|------------|
| `model/` | Dados + regras de negócio | `@freezed`, repository interface |
| `viewmodel/` | Estado da UI | Provider `@riverpod` |
| `view/` | Interface do usuário | `ConsumerWidget` |

---

## 1. Core — Configuração base

### 1.1 entrypoint (`main.dart`)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tcc_flutter_app/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  runApp(ProviderScope(child: const App()));
}
```

### 1.2 Widget raiz (`app.dart`)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/core/routes/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
```

### 1.3 Providers globais (`core/providers/app_providers.dart`)

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_providers.g.dart';

final darkModeProvider = StateProvider<bool>((ref) => false);
final supabaseProvider = Provider<SupabaseClient>((ref) => Supabase.instance.client);

@riverpod
Future<Position> userLocations(Ref ref) async {
  await Geolocator.requestPermission();
  return await Geolocator.getCurrentPosition();
}
```

### 1.4 Navegação (`core/routes/router.dart`)

```dart
import 'package:go_router/go_router.dart';
import 'package:tcc_flutter_app/src/core/ui/widgets/navigation_shell_route.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/cursos/view/cursos_view.dart';
import 'package:tcc_flutter_app/src/features/cursos/view/detalhe_curso_view.dart';
import 'package:tcc_flutter_app/src/features/home/view/home_view.dart';
import 'package:tcc_flutter_app/src/features/mapa/google_maps_view.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/view/projeto_detalhe_view.dart';
import 'package:tcc_flutter_app/src/features/projetos/view/projetos_view.dart';
import 'package:tcc_flutter_app/src/features/vestibulinho/vestibulinho_view.dart';

final router = GoRouter(
  initialLocation: '/vestibulinho',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNavigationShell(shell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/home', builder: (context, state) => HomeView()),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/projetos',
              builder: (context, state) => ProjetosView(),
              routes: [
                GoRoute(
                  path: '/detalhe',
                  builder: (context, state) {
                    final projeto = state.extra as ProjetoModel;
                    return ProjetoDetalheView(projeto: projeto);
                  },
                ),
              ],
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
              builder: (context, state) => GoogleMapsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/vestibulinho',
              builder: (context, state) => VestibulinhoView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
```

### 1.5 NavigationShell (`core/ui/widgets/navigation_shell_route.dart`)

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavigationShell extends StatelessWidget {
  const ScaffoldWithNavigationShell({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (index) =>
            shell.goBranch(index, initialLocation: index == shell.currentIndex),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'Projetos',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Cursos',
          ),
          NavigationDestination(
            icon: Icon(Icons.event_note_outlined),
            selectedIcon: Icon(Icons.event_note),
            label: 'Eventos',
          ),
          NavigationDestination(
            icon: Icon(Icons.checklist_outlined),
            selectedIcon: Icon(Icons.checklist),
            label: 'Vestibulinho',
          ),
        ],
      ),
    );
  }
}
```

---

## 2. Feature: Home

### 2.1 Widgets reutilizáveis

**`ImagemDestaqueWidget`** — Exibe uma imagem com overlay gradiente, título e botão:

```dart
class ImagemDestaqueWidget extends StatelessWidget {
  const ImagemDestaqueWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.callBack,
  });

  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black12,
                  Colors.black54,
                  Colors.black87,
                ],
              ),
            ),
            alignment: Alignment.bottomRight,
            child: ListTile(
              leading: Icon(Icons.school, color: Colors.white),
              title: Text(title, style: TextStyle(color: Colors.white)),
              subtitle: Text(subtitle, style: TextStyle(color: Colors.white)),
              trailing: OutlinedButton(
                onPressed: callBack,
                child: Text('Acessar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
```

### 2.2 HomeView

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/features/home/view/widgets/imagem_destaque_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(title: const Text('Etec Alberto Feres')),
        SliverToBoxAdapter(
          child: ImagemDestaqueWidget(
            imageUrl:
                'https://images.pexels.com/photos/267885/pexels-photo-267885.jpeg',
            title: 'Vestibulinho 2025',
            subtitle: 'Curso Técnico Gratuito',
            buttonText: 'Acessar',
            callBack: () async => _launchInBrowser(
              Uri.parse('https://vestibulinho.etec.sp.gov.br/home/'),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Projetos de destaque',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: CarouselView(
              itemSnapping: true,
              itemExtent: 300,
              children: [
                Container(
                  color: Colors.red.shade500,
                  child: Placeholder(color: Colors.red.shade200),
                ),
                Container(
                  color: Colors.green.shade500,
                  child: Placeholder(color: Colors.green.shade200),
                ),
                Container(
                  color: Colors.blue.shade500,
                  child: Placeholder(color: Colors.blue.shade200),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
```

---

## 3. Feature: Cursos

### 3.1 Model

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'curso_model.freezed.dart';
part 'curso_model.g.dart';

@freezed
abstract class CursoModel with _$CursoModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CursoModel({
    @JsonKey(name: 'id', includeToJson: false) int? id,
    String? nome,
    String? descricao,
    String? ementaResumida,
    String? urlImagem,
    bool? vestibulinho,
  }) = _CursoModel;

  factory CursoModel.fromJson(Map<String, dynamic> json) =>
      _$CursoModelFromJson(json);
}
```

### 3.2 Repository — Interface

```dart
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';

abstract class CursoRepository {
  Future<List<CursoModel>> getCursos();
}
```

### 3.3 Repository — Implementação

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/repository/curso_repository.dart';

part 'curso_repository_impl.g.dart';

class CursoRepositoryImpl implements CursoRepository {
  final SupabaseClient supabase;

  CursoRepositoryImpl({required this.supabase});

  @override
  Future<List<CursoModel>> getCursos() async {
    final response = await supabase.from('cursos').select();
    return [for (final curso in response) CursoModel.fromJson(curso)];
  }
}

@riverpod
CursoRepositoryImpl cursoRepositoryImpl(Ref ref) {
  return CursoRepositoryImpl(supabase: ref.watch(supabaseProvider));
}
```

### 3.4 ViewModel

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/repository/curso_repository_impl.dart';

part 'cursos_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class CursosViewModel extends _$CursosViewModel {
  @override
  FutureOr<List<CursoModel>> build() async {
    return ref.watch(cursoRepositoryImplProvider).getCursos();
  }
}
```

### 3.5 Views

**CursosView** — Tela principal que lista os cursos:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/features/cursos/view/widgets/lista_cursos_widget.dart';
import 'package:tcc_flutter_app/src/features/cursos/viewmodel/cursos_viewmodel.dart';

class CursosView extends ConsumerWidget {
  const CursosView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cursos = ref.watch(cursosViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Cursos')),
      body: cursos.when(
        data: (cursos) => ListaCursosWidget(cursos: cursos),
        error: (error, stackTrace) =>
            const Center(child: Text('Erro ao carregar cursos')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
```

**ListaCursosWidget** — Lista com navegação para detalhe:

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';

class ListaCursosWidget extends StatelessWidget {
  const ListaCursosWidget({super.key, required this.cursos});

  final List<CursoModel> cursos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cursos.length,
      itemBuilder: (context, index) {
        final curso = cursos[index];
        return ListTile(
          leading: CircleAvatar(
              child: Text((curso.nome ?? '?').substring(0, 1))),
          title: Text(curso.nome ?? ''),
          subtitle: Text(curso.descricao ?? ''),
          onTap: () => context.go('/cursos/curso', extra: curso),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
```

**DetalheCursoView** — Tela de detalhe do curso com SliverAppBar:

```dart
import 'package:flutter/material.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';

class DetalheCursoView extends StatelessWidget {
  const DetalheCursoView({super.key, required this.curso});

  final CursoModel curso;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              curso.urlImagem ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Icon(Icons.school,
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                final total = loadingProgress.expectedTotalBytes;
                final loaded = loadingProgress.cumulativeBytesLoaded;
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: LinearProgressIndicator(
                    value: total != null ? loaded / total : null,
                  ),
                );
              },
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                curso.nome ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                curso.descricao ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                curso.ementaResumida ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ]),
        ),
        SliverFillRemaining(),
      ],
    );
  }
}
```

---

## 4. Feature: Projetos

### 4.1 Models

**ProjetoModel:**

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';

part 'prodeto_model.g.dart';
part 'prodeto_model.freezed.dart';

@freezed
abstract class ProjetoModel with _$ProjetoModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProjetoModel({
    @JsonKey(includeToJson: false) int? id,
    required String titulo,
    required String descricao,
    @JsonKey(name: 'link_externo') required String url,
    @JsonKey(name: 'imagem_capa') required String urlImagem,
    @JsonKey(name: 'cursos') required CursoModel curso,
  }) = _ProjetoModel;

  factory ProjetoModel.fromJson(Map<String, dynamic> json) =>
      _$ProjetoModelFromJson(json);
}
```

**AlunoModel:**

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aluno_model.g.dart';
part 'aluno_model.freezed.dart';

@freezed
abstract class AlunoModel with _$AlunoModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AlunoModel({
    @JsonKey(includeToJson: false) int? id,
    required String nome,
    required String email,
    required String fotoPerfil,
  }) = _AlunoModel;

  factory AlunoModel.fromJson(Map<String, dynamic> json) =>
      _$AlunoModelFromJson(json);
}
```

**AlunoProjetoModel** (relacionamento N:N entre alunos e projetos):

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/aluno_model.dart';

part 'aluno_projeto_model.g.dart';
part 'aluno_projeto_model.freezed.dart';

@freezed
abstract class AlunoProjetoModel with _$AlunoProjetoModel {
  const factory AlunoProjetoModel({
    required String papel,
    @JsonKey(name: 'alunos') required AlunoModel aluno,
  }) = _AlunoProjetoModel;

  factory AlunoProjetoModel.fromJson(Map<String, dynamic> json) =>
      _$AlunoProjetoModelFromJson(json);
}
```

### 4.2 Repositories

**ProjetosRepository:**

```dart
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';

abstract class ProjetosRepository {
  Future<List<ProjetoModel>> findAll();
}
```

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/repositories/projetos_repository.dart';

part 'projetos_repository_impl.g.dart';

class ProjetosRepositoryImpl implements ProjetosRepository {
  final SupabaseClient supabase;

  ProjetosRepositoryImpl({required this.supabase});

  @override
  Future<List<ProjetoModel>> findAll() async {
    final projetos = await supabase
        .from('projetos')
        .select('*, cursos(*)');
    return [for (final projeto in projetos) ProjetoModel.fromJson(projeto)];
  }
}

@riverpod
ProjetosRepository projetosRepository(Ref ref) {
  return ProjetosRepositoryImpl(supabase: ref.watch(supabaseProvider));
}
```

**AlunosRepository:**

```dart
import 'package:tcc_flutter_app/src/features/projetos/model/aluno_projeto_model.dart';

abstract class AlunosRepository {
  Future<List<AlunoProjetoModel>> findByProjetoId(int idProjeto);
}
```

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/aluno_projeto_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/repositories/alunos_repository.dart';

part 'alunos_repository_impl.g.dart';

class AlunosRepositoryImpl implements AlunosRepository {
  final SupabaseClient supabase;

  AlunosRepositoryImpl({required this.supabase});

  @override
  Future<List<AlunoProjetoModel>> findByProjetoId(int idProjeto) async {
    final rows = await supabase
        .from('alunos_projetos')
        .select('''
          papel,
          alunos!inner(id, nome, email, foto_perfil)
        ''')
        .eq('id_projeto', idProjeto);

    return [for (final row in rows) AlunoProjetoModel.fromJson(row)];
  }
}

@riverpod
AlunosRepository alunosRepository(Ref ref) {
  return AlunosRepositoryImpl(supabase: ref.watch(supabaseProvider));
}
```

### 4.3 ViewModel

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/repositories/projetos_repository_impl.dart';

part 'projetos_viewmodel.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<ProjetoModel>> projetos(Ref ref) {
  return ref.watch(projetosRepositoryProvider).findAll();
}
```

### 4.4 Views

**ProjetosView** — Lista todos os projetos:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/features/projetos/viewmodel/projetos_viewmodel.dart';
import 'package:tcc_flutter_app/src/features/projetos/view/widgets/lista_projetos_widget.dart';

class ProjetosView extends ConsumerWidget {
  const ProjetosView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projetos = ref.watch(projetosProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Projetos')),
      body: projetos.when(
        data: (data) => ListaProjetosWidget(projetos: data),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Center(child: Text('Erro ao carregar projetos.')),
      ),
    );
  }
}
```

**ProjetoWidget** — Card individual com imagem, título, descrição, chip do curso e botão:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';

class ProjetoWidget extends ConsumerWidget {
  const ProjetoWidget({super.key, required this.projeto});

  final ProjetoModel projeto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  projeto.urlImagem,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    child: Icon(Icons.broken_image,
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    final total = loadingProgress.expectedTotalBytes;
                    final loaded = loadingProgress.cumulativeBytesLoaded;
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: LinearProgressIndicator(
                        value: total != null ? loaded / total : null,
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 4,
                  right: 6,
                  child: Chip(
                    label: Text(projeto.curso.nome ?? ''),
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              projeto.titulo,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              projeto.descricao,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 16),
              child: FilledButton(
                onPressed: () =>
                    context.go('/projetos/detalhe', extra: projeto),
                child: const Text('Ver projeto'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

**ProjetoDetalheView** — Tela de detalhe com informações, alunos e link externo:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/aluno_projeto_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/prodeto_model.dart';
import 'package:tcc_flutter_app/src/features/projetos/model/repositories/alunos_repository_impl.dart';

class ProjetoDetalheView extends ConsumerWidget {
  const ProjetoDetalheView({super.key, required this.projeto});

  final ProjetoModel projeto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alunosRepo = ref.watch(alunosRepositoryProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                projeto.urlImagem,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Icon(Icons.broken_image,
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  final total = loadingProgress.expectedTotalBytes;
                  final loaded = loadingProgress.cumulativeBytesLoaded;
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: LinearProgressIndicator(
                      value: total != null ? loaded / total : null,
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(label: Text(projeto.curso.nome ?? 'Curso')),
                  const SizedBox(height: 8),
                  Text(
                    projeto.titulo,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(projeto.descricao,
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  Text(
                    'Alunos participantes',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
          FutureBuilder<List<AlunoProjetoModel>>(
            future: alunosRepo.findByProjetoId(projeto.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(child: Text('Erro ao carregar alunos')),
                );
              }
              final alunos = snapshot.data ?? [];
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final alunoProjeto = alunos[index];
                    final aluno = alunoProjeto.aluno;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: aluno.fotoPerfil.isNotEmpty
                            ? NetworkImage(aluno.fotoPerfil)
                            : null,
                        child: aluno.fotoPerfil.isEmpty
                            ? Text(aluno.nome.isNotEmpty
                                ? aluno.nome[0].toUpperCase()
                                : '?')
                            : null,
                      ),
                      title: Text(aluno.nome),
                      subtitle: Text(
                        alunoProjeto.papel.isNotEmpty
                            ? alunoProjeto.papel
                            : 'Participante',
                      ),
                    );
                  },
                  childCount: alunos.length,
                ),
              );
            },
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: FilledButton.icon(
                  onPressed: () async {
                    final uri = Uri.parse(projeto.url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Ver projeto completo'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 5. Feature: Mapa

Exibe prestadores de serviços próximos no Google Maps usando geolocalização.

### 5.1 Model

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'prestador_model.g.dart';
part 'prestador_model.freezed.dart';

@freezed
abstract class PrestadorModel with _$PrestadorModel {
  const factory PrestadorModel({
    @JsonKey(includeToJson: false) required String id,
    required String nome,
    required String endereco,
    required double latitude,
    required double longitude,
    required double distancia,
  }) = _PrestadorModel;

  factory PrestadorModel.fromJson(Map<String, dynamic> json) =>
      _$PrestadorModelFromJson(json);
}
```

### 5.2 Provider com RPC

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/mapa/prestador_model.dart';

part 'prestadores.g.dart';

@riverpod
Future<List<PrestadorModel>> prestadoresProximos(
  Ref ref, {
  double distanciaMaxima = 5000,
}) async {
  final position = await ref.watch(userLocationsProvider.future);
  final response = await ref
      .read(supabaseProvider)
      .rpc('buscar_prestadores_proximos', params: {
    'lat': position.latitude,
    'lng': position.longitude,
    'max': distanciaMaxima,
  });
  return [for (final item in response) PrestadorModel.fromJson(item)];
}
```

### 5.3 GoogleMapsView

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/mapa/prestadores.dart';

class GoogleMapsView extends ConsumerWidget {
  const GoogleMapsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocation = ref.watch(userLocationsProvider);
    final prestadores = ref.watch(
      prestadoresProximosProvider(distanciaMaxima: 10000),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa')),
      body: prestadores.when(
        data: (data) => GoogleMap(
          indoorViewEnabled: true,
          initialCameraPosition: CameraPosition(
            zoom: 13,
            target: LatLng(
              userLocation.value!.latitude,
              userLocation.value!.longitude,
            ),
          ),
          markers: {
            for (final prestador in data)
              Marker(
                markerId: MarkerId(prestador.id),
                position: LatLng(prestador.latitude, prestador.longitude),
                infoWindow: InfoWindow(
                  title: prestador.nome,
                  snippet: prestador.endereco,
                ),
              ),
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Center(child: Text('Erro ao carregar prestadores')),
      ),
    );
  }
}
```

---

## 6. Feature: Vestibulinho

Lista cursos que possuem processo seletivo (campo `vestibulinho = true`).

### 6.1 Repository

```dart
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';

abstract interface class CursoVestibulinhoRepository {
  Future<List<CursoModel>> findAll();
}
```

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/vestibulinho/model/curso_vestibulinho_repository.dart';

part 'curso_vestibulinho_repository_impl.g.dart';

class CursoVestibulinhoRepositoryImpl implements CursoVestibulinhoRepository {
  final SupabaseClient supabase;

  CursoVestibulinhoRepositoryImpl({required this.supabase});

  @override
  Future<List<CursoModel>> findAll() async {
    final response =
        await supabase.from('cursos').select('*').eq('vestibulinho', true);
    return [for (final curso in response) CursoModel.fromJson(curso)];
  }
}

@riverpod
CursoVestibulinhoRepository cursoVestibulinhoRepository(Ref ref) {
  return CursoVestibulinhoRepositoryImpl(supabase: ref.watch(supabaseProvider));
}
```

### 6.2 ViewModel

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';
import 'package:tcc_flutter_app/src/features/vestibulinho/model/curso_vestibulinho_repository_impl.dart';

part 'curso_vestibulinho_viewmodel.g.dart';

@riverpod
FutureOr<List<CursoModel>> cursosVestibulinho(Ref ref) async {
  return await ref.read(cursoVestibulinhoRepositoryProvider).findAll();
}
```

### 6.3 VestibulinhoView

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tcc_flutter_app/src/features/vestibulinho/viewmodel/curso_vestibulinho_viewmodel.dart';
import 'package:tcc_flutter_app/src/features/vestibulinho/widgets/curso_vestibulinho_widget.dart';

class VestibulinhoView extends ConsumerWidget {
  const VestibulinhoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cursosVestibulinho = ref.watch(cursosVestibulinhoProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Vestibulinho')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyJM_JeVrhRCXONOdo4yDz_jLkkUK13JY_wbLmxtoVeA&s=10',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.school,
                          size: 48,
                          color: Theme.of(context).colorScheme.onSurfaceVariant),
                      const SizedBox(height: 8),
                      Text('Vestibulinho',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
              ),
            ),
            cursosVestibulinho.when(
              data: (cursos) => Column(
                children: List.generate(
                  cursos.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 8),
                    child: CursoVestibulinhoWidget(curso: cursos[index]),
                  ),
                ),
              ),
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),
              loading: () => Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final uri = Uri.parse('https://vestibulinho.etec.sp.gov.br/home/');
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        label: const Text('INSCREVA-SE'),
        icon: const Icon(Icons.link),
      ),
    );
  }
}
```

### 6.4 CursoVestibulinhoWidget

```dart
import 'package:flutter/material.dart';
import 'package:tcc_flutter_app/src/features/cursos/model/curso_model.dart';

class CursoVestibulinhoWidget extends StatelessWidget {
  const CursoVestibulinhoWidget({super.key, required this.curso});

  final CursoModel curso;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Flexible(
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  curso.urlImagem ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        child: Icon(Icons.broken_image,
                            color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    curso.nome ?? 'Curso',
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    curso.descricao ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 7. Exemplo: Counter

Um contador simples com `StateProvider` e `@riverpod` para demonstrar o padrão básico do Riverpod.

### ViewModel

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_viewmodel.g.dart';

@riverpod
class CounterViewModel extends _$CounterViewModel {
  @override
  int build() => 0;

  void increment() => state++;
}
```

### View

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/counter/viewmodel/counter_viewmodel.dart';

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterViewModelProvider);
    final viewmodel = ref.read(counterViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(darkModeProvider.notifier).update((state) => !state),
            icon: ref.watch(darkModeProvider)
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewmodel.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

---

## 8. Banco de Dados (Supabase)

Execute os scripts abaixo no SQL Editor do Supabase para criar as tabelas e popular com dados de exemplo.

### Tabelas

```sql
CREATE TABLE cursos (
    id BIGSERIAL PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    descricao TEXT,
    ementa_resumida TEXT,
    url_imagem TEXT,
    vestibulinho BOOLEAN DEFAULT false,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE areas_atuacao (
    id BIGSERIAL PRIMARY KEY,
    id_curso BIGINT NOT NULL REFERENCES cursos(id) ON DELETE CASCADE,
    descricao TEXT NOT NULL
);

CREATE TABLE coordenadores (
    id BIGSERIAL PRIMARY KEY,
    id_curso BIGINT NOT NULL REFERENCES cursos(id) ON DELETE CASCADE,
    nome TEXT NOT NULL,
    email TEXT,
    telefone TEXT
);

CREATE TABLE projetos (
    id BIGSERIAL PRIMARY KEY,
    id_curso BIGINT NOT NULL REFERENCES cursos(id) ON DELETE CASCADE,
    titulo TEXT NOT NULL,
    descricao TEXT,
    link_externo TEXT,
    imagem_capa TEXT,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE alunos (
    id BIGSERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT UNIQUE,
    foto_perfil TEXT,
    criado_em TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE alunos_projetos (
    id BIGSERIAL PRIMARY KEY,
    id_aluno BIGINT NOT NULL REFERENCES alunos(id) ON DELETE CASCADE,
    id_projeto BIGINT NOT NULL REFERENCES projetos(id) ON DELETE CASCADE,
    papel TEXT,
    UNIQUE(id_aluno, id_projeto)
);
```

### Função RPC (para o Mapa)

```sql
CREATE OR REPLACE FUNCTION buscar_prestadores_proximos(
    lat DOUBLE PRECISION,
    lng DOUBLE PRECISION,
    max_dist DOUBLE PRECISION DEFAULT 5000
)
RETURNS TABLE(
    id TEXT,
    nome TEXT,
    endereco TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    distancia DOUBLE PRECISION
)
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    SELECT
        p.id::TEXT,
        p.nome,
        p.endereco,
        p.latitude,
        p.longitude,
        -- Cálculo de distância aproximada (Haversine simplificado)
        6371000 * 2 * ASIN(SQRT(
            POW(SIN(RADIANS(p.latitude - lat) / 2), 2) +
            COS(RADIANS(lat)) * COS(RADIANS(p.latitude)) *
            POW(SIN(RADIANS(p.longitude - lng) / 2), 2)
        )) AS distancia
    FROM prestadores p
    WHERE 6371000 * 2 * ASIN(SQRT(
        POW(SIN(RADIANS(p.latitude - lat) / 2), 2) +
        COS(RADIANS(lat)) * COS(RADIANS(p.latitude)) *
        POW(SIN(RADIANS(p.longitude - lng) / 2), 2)
    )) <= max_dist
    ORDER BY distancia;
END;
$$;
```

> Nota: Crie também uma tabela `prestadores` com os campos `id (BIGSERIAL)`, `nome (TEXT)`, `endereco (TEXT)`, `latitude (DOUBLE PRECISION)`, `longitude (DOUBLE PRECISION)` e popula com dados de estabelecimentos próximos à Etec.

### Dados de exemplo

```sql
-- CURSOS
INSERT INTO cursos (nome, descricao, ementa_resumida, url_imagem, vestibulinho)
VALUES
('Desenvolvimento de Sistemas',
 'Curso voltado à formação de profissionais capazes de projetar, implementar e manter sistemas computacionais.',
 'Lógica de programação, banco de dados, desenvolvimento web e mobile, versionamento de código, APIs e integração de sistemas.',
 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1200&q=80',
 true),

('Administração',
 'Forma profissionais aptos a planejar, executar e avaliar atividades administrativas em empresas públicas e privadas.',
 'Gestão empresarial, marketing, contabilidade, economia e empreendedorismo.',
 'https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1200&q=80',
 true),

('Automação Industrial',
 'Capacita o aluno a desenvolver e manter sistemas automatizados de controle de processos industriais.',
 'Eletroeletrônica, sensores, controladores lógicos programáveis (CLP), instrumentação e robótica.',
 'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=1200&q=80',
 true),

('Informática para Internet',
 'Forma técnicos capazes de criar, projetar e implementar soluções baseadas em tecnologias web.',
 'Desenvolvimento front-end e back-end, UX/UI, hospedagem e otimização de sites.',
 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=1200&q=80',
 false);

-- ÁREAS DE ATUAÇÃO
INSERT INTO areas_atuacao (id_curso, descricao)
VALUES
(1, 'Desenvolvimento Web e Mobile'),
(1, 'Análise de Sistemas'),
(2, 'Gestão Empresarial e Empreendedorismo'),
(2, 'Recursos Humanos e Finanças'),
(3, 'Controle e Automação de Processos'),
(3, 'Robótica e Instrumentação'),
(3, 'Design e Desenvolvimento Web'),
(3, 'E-commerce e Marketing Digital');

-- COORDENADORES
INSERT INTO coordenadores (id_curso, nome, email, telefone)
VALUES
(1, 'Prof. Carlos Henrique Moraes', 'carlos.moraes@etec.sp.gov.br', '(19) 3543-1234'),
(2, 'Profa. Juliana Batista Lopes', 'juliana.lopes@etec.sp.gov.br', '(19) 3543-5678'),
(3, 'Prof. Renato Sampaio Silva', 'renato.sampaio@etec.sp.gov.br', '(19) 3543-8765'),
(3, 'Profa. Adriana Pires Martins', 'adriana.martins@etec.sp.gov.br', '(19) 3543-9988');

-- PROJETOS
INSERT INTO projetos (id_curso, titulo, descricao, link_externo, imagem_capa)
VALUES
(1, 'SmartRecycle - Sistema de Coleta Inteligente',
 'Aplicativo mobile e web para gestão e gamificação da coleta seletiva em bairros de Araras, com integração via API Supabase.',
 'https://github.com/eetec-araras/smartrecycle',
 'https://images.unsplash.com/photo-1532996122724-e3c354a0b15b?auto=format&fit=crop&w=1200&q=80'),

(1, 'Jokenpo+ - Jogo Interativo em Flutter',
 'Versão expandida do clássico jogo Jokenpo (Pedra, Papel, Tesoura, Lagarto e Spock) com ranking de jogadores e integração com Supabase.',
 'https://github.com/eetec-araras/jokenpo-plus',
 'https://images.unsplash.com/photo-1511512578047-dfb367046420?auto=format&fit=crop&w=1200&q=80'),

(2, 'EcoGestão - Sustentabilidade Empresarial',
 'Plataforma de monitoramento de indicadores de sustentabilidade para pequenas empresas da região de Araras.',
 'https://github.com/eetec-araras/ecogestao',
 'https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=1200&q=80'),

(3, 'RobotArmX - Braço Robótico Didático',
 'Protótipo funcional de braço robótico controlado via interface web e microcontroladores ESP32, com sensores de precisão.',
 'https://github.com/eetec-araras/robotarmx',
 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?auto=format&fit=crop&w=1200&q=80'),

(3, 'Portal ETEC Digital',
 'Portal integrado para divulgação de eventos, notícias e projetos da Etec, desenvolvido com Flutter Web e Supabase.',
 'https://github.com/eetec-araras/etec-digital',
 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&q=80');

-- ALUNOS
INSERT INTO alunos (nome, email, foto_perfil)
VALUES
('Lucas Ferreira da Silva', 'lucas.silva@etecalbertoferes.com', 'https://ui-avatars.com/api/?name=Lucas+Ferreira+da+Silva&background=2563eb&color=fff&size=512'),
('Maria Eduarda Campos', 'maria.campos@etecalbertoferes.com', 'https://ui-avatars.com/api/?name=Maria+Eduarda+Campos&background=db2777&color=fff&size=512'),
('Rafael Lima Santos', 'rafael.lima@etecalbertoferes.com', 'https://ui-avatars.com/api/?name=Rafael+Lima+Santos&background=16a34a&color=fff&size=512'),
('Beatriz Andrade Souza', 'beatriz.souza@etecalbertoferes.com', 'https://ui-avatars.com/api/?name=Beatriz+Andrade+Souza&background=9333ea&color=fff&size=512'),
('João Pedro Oliveira', 'joao.oliveira@etecalbertoferes.com', 'https://ui-avatars.com/api/?name=Joao+Pedro+Oliveira&background=f97316&color=fff&size=512');

-- ALUNOS_PROJETOS
INSERT INTO alunos_projetos (id_aluno, id_projeto, papel)
VALUES
(1, 1, 'Desenvolvedor Full Stack'),
(2, 1, 'UX/UI Designer'),
(3, 2, 'Desenvolvedor Flutter'),
(4, 3, 'Analista de Sustentabilidade'),
(5, 4, 'Programador de CLP'),
(1, 5, 'Desenvolvedor Web'),
(2, 5, 'Gerente de Conteúdo');
```
