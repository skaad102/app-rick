import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/episodio.dart';
import '../../../domain/repository/episode_repository.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  final EpisodeRepository _repository;
  int page = 1;
  bool isLoading = false;
  EpisodesCubit(this._repository) : super(const EpisodesState(episodes: []));

  Future<void> loadEpisodes() async {
    try {
      if (isLoading) return;
      isLoading = true;
      final episodes = await _repository.getEpisodes(page: page);
      emit(EpisodesState(episodes: [...state.episodes, ...episodes]));
      page++;
      await Future.delayed(const Duration(milliseconds: 500));
      isLoading = false;
    } catch (e) {
      // Emitir un estado de error...
    }
  }
}
