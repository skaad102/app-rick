import 'package:choppi_rick/domain/entities/episodio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/episodios/episodes_cubit.dart';

class ListEpisodios extends StatefulWidget {
  const ListEpisodios({super.key});

  @override
  State<ListEpisodios> createState() => _ListEpisodiosState();
}

class _ListEpisodiosState extends State<ListEpisodios> {
  @override
  void initState() {
    super.initState();
    context.read<EpisodesCubit>().loadEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodios'),
      ),
      body: BlocBuilder<EpisodesCubit, EpisodesState>(
        builder: (context, state) {
          final episodioss = state.episodes;
          if (episodioss.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: state.episodes.length,
            itemBuilder: (context, index) {
              final episodio = state.episodes[index];
              return CardEpisodio(episodio: episodio);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<EpisodesCubit>().loadEpisodes();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CardEpisodio extends StatelessWidget {
  final Episodio episodio;
  const CardEpisodio({super.key, required this.episodio});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(episodio.name),
        subtitle: Text(episodio.airDate),
      ),
    );
  }
}
