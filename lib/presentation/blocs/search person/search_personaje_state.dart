part of 'search_personaje_cubit.dart';

class SearchPersonajeState extends Equatable {
  final List<Personaje> personajes;
  bool isLoading;

  SearchPersonajeState({
    this.isLoading = false,
    this.personajes = const [],
  });

  @override
  List<Object?> get props => [personajes, isLoading];
}
