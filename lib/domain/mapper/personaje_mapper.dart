import 'package:choppi_rick/domain/entities/personaje.dart';
import 'package:choppi_rick/domain/models/characterDB.dart';

class PersonajeMaper {
  static Personaje castToEntity(Result result) => Personaje(
      id: result.id.toString(),
      name: result.name,
      status: result.status.toString(),
      species: result.species.toString(),
      type: result.type,
      gender: result.gender.toString(),
      origin: result.origin.toString(),
      location: result.location.toString(),
      image: result.image,
      episode: result.episode,
      url: result.url,
      created: result.created.toString());
}
