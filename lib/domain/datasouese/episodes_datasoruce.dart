import 'package:choppi_rick/domain/entities/episodio.dart';
import 'package:choppi_rick/domain/mapper/episodio_mapper.dart';
import 'package:choppi_rick/domain/models/episodesDB.dart';
import 'package:dio/dio.dart';

class EpisodesDatasource {
  final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<List<Episodio>> getEpisodios({int page = 1}) async {
    try {
      final response =
          await _dio.get('/episode', queryParameters: {'page': page});
      final result = response.data;
      final episodios = EpisodesResponse.fromJson(result);
      if (episodios.results.isEmpty) return [];
      final espisodios =
          episodios.results.map((e) => EpisodioMaper.castToEntity(e)).toList();
      return espisodios;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
