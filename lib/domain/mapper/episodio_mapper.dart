import 'package:choppi_rick/domain/entities/episodio.dart';
import 'package:choppi_rick/domain/models/episodesDB.dart';

class EpisodioMaper {
  static Episodio castToEntity(Result result) => Episodio(
        id: result.id,
        name: result.name,
        airDate: result.airDate,
        episode: result.episode,
        characters: result.characters,
        url: result.url,
        created: result.created.toString(),
      );
}
