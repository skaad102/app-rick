import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/theme/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: const ContentHome(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ThemeCubit>().changeTheme();
        },
        child: Icon(cubit.state.appTheme.isDark
            ? Icons.wb_sunny
            : Icons.nightlight_round),
      ),
    );
  }
}

class ContentHome extends StatelessWidget {
  const ContentHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Personajes'),
          onTap: () {
            context.push('/home/list_personajes');
          },
          leading: const Icon(Icons.person),
        ),
        ListTile(
          title: const Text('Episodios'),
          onTap: () {
            context.push('/home/list_episodios');
          },
          leading: const Icon(Icons.movie),
        ),
        /* buscar */
        ListTile(
          title: const Text('Buscar'),
          onTap: () {
            context.push('/home/search');
          },
          leading: const Icon(Icons.search),
        ),
      ],
    );
  }
}
