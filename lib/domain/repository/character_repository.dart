import '../datasouese/character_datasource.dart';
import '../entities/personaje.dart';

class CharacterRepository {
  final CharacterDatasource _datasource;

  CharacterRepository(this._datasource);

  Future<List<Personaje>> getPersonajes({int page = 1}) async {
    return await _datasource.getPersonajes(page: page);
  }

  Future<Personaje> getPersonaje(String id) async {
    return await _datasource.getPersonaje(id);
  }

  Future<List<Personaje>> searchPersonaje(String name, {int page = 1}) async {
    return await _datasource.searchPersonaje(name, page: page);
  }
}
