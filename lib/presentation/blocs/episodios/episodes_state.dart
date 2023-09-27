part of 'episodes_cubit.dart';

class EpisodesState extends Equatable {
  final List<Episodio> episodes;
  const EpisodesState({required this.episodes});

  @override
  List<Object> get props => [episodes];
}
