import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/personaje.dart';
import '../../../domain/repository/character_repository.dart';

part 'search_personaje_state.dart';

class SearchPersonajeCubit extends Cubit<SearchPersonajeState> {
  final CharacterRepository _repository;
  int page = 1;
  String name = '';
  bool isLoadingMore = false;
  SearchPersonajeCubit(this._repository) : super(SearchPersonajeState());

  Future<void> searchPersonaje(String name) async {
    this.name = name;
    page = 1;
    emit(SearchPersonajeState(personajes: const []));
    if (state.isLoading) return;
    emit(SearchPersonajeState(isLoading: true, personajes: state.personajes));

    final personajes = await _repository.searchPersonaje(name);
    log("personajes $personajes");
    if (personajes.isEmpty) {
      page = 1;
      emit(SearchPersonajeState(personajes: const [], isLoading: false));
      return;
    }
    emit(SearchPersonajeState(personajes: personajes));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(SearchPersonajeState(isLoading: false, personajes: personajes));
    log("pagina $page");
  }

  Future<void> serchMorePersonajes() async {
    if (isLoadingMore) return;
    isLoadingMore = true;
    page++;
    final personajes = await _repository.searchPersonaje(name, page: page);
    if (personajes.isEmpty) return;
    emit(
        SearchPersonajeState(personajes: [...state.personajes, ...personajes]));
    await Future.delayed(const Duration(milliseconds: 500));
    isLoadingMore = false;
  }
}
