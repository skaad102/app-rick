import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/personaje.dart';
import '../../../domain/repository/character_repository.dart';

part 'personajes_state.dart';

class PersonajesCubit extends Cubit<PersonajesState> {
  final CharacterRepository _repository;
  int page = 1;
  bool isLoading = false;
  PersonajesCubit(this._repository)
      : super(const PersonajesState(personajes: []));

  Future<void> loadCharacters() async {
    try {
      if (isLoading) return;
      isLoading = true;
      final characters = await _repository.getPersonajes(page: page);
      emit(PersonajesState(personajes: [...state.personajes, ...characters]));
      page++;
      await Future.delayed(const Duration(milliseconds: 500));
      isLoading = false;
    } catch (e) {
      // Emitir un estado de error...
    }
  }

  Future<Personaje> loadCharacter(String id) async {
    final character = await _repository.getPersonaje(id);
    return character;
  }
}
