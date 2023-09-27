import 'package:choppi_rick/domain/entities/episodio.dart';

import '../datasouese/episodes_datasoruce.dart';

class EpisodeRepository {
  final EpisodesDatasource _dataSource;

  EpisodeRepository(this._dataSource);

  Future<List<Episodio>> getEpisodes({int page = 1}) async {
    return await _dataSource.getEpisodios(page: page);
  }
}
