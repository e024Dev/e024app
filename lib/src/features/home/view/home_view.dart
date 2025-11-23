import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/features/home/view/widgets/imagem_destaque_widget.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(title: const Text('Etec Alberto Feres')),
        SliverToBoxAdapter(
          child: ImagemDestaqueWidget(
            imageUrl: 'https://images.pexels.com/photos/267885/pexels-photo-267885.jpeg',
            title: 'TCCs',
            subtitle: 'Projetos de destaque',
            buttonText: 'Acessar',
            onPressed: () {},
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
