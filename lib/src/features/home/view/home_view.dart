import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(title: const Text('Etec Alberto Feres')),
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Image.network(
                'https://images.pexels.com/photos/267885/pexels-photo-267885.jpeg',
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
                    title: Text(
                      'Cursos',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Projetos',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Acessar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Projetos de destaque',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
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
}
