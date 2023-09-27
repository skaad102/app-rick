part of 'personajes_cubit.dart';

class PersonajesState extends Equatable {
  final List<Personaje> personajes;
  const PersonajesState({required this.personajes});

  @override
  List<Object> get props => [personajes];
}
