import 'package:choppi_rick/domain/entities/personaje.dart';
import 'package:choppi_rick/domain/models/characterDB.dart';
import 'package:dio/dio.dart';

import '../mapper/personaje_mapper.dart';

class CharacterDatasource {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<List<Personaje>> getPersonajes({int page = 1}) async {
    try {
      final response =
          await _dio.get('/character', queryParameters: {'page': page});
      final result = response.data;
      final characters = CharacterResponse.fromJson(result);
      if (characters.results.isEmpty) return [];

      final personajes = characters.results
          .map((e) => PersonajeMaper.castToEntity(e))
          .toList();
      return personajes;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Personaje> getPersonaje(String id) async {
    final response = await _dio.get('/character/$id');
    final personaje =
        PersonajeMaper.castToEntity(Result.fromJson(response.data));

    return personaje;
  }

  Future<List<Personaje>> searchPersonaje(String name, {int page = 1}) async {
    try {
      final response = await _dio.get('/character', queryParameters: {
        'page': page,
        'name': name,
      });
      final result = response.data;
      final characters = CharacterResponse.fromJson(result);
      if (characters.results.isEmpty) return [];

      final personajes = characters.results
          .map((e) => PersonajeMaper.castToEntity(e))
          .toList();
      return personajes;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
