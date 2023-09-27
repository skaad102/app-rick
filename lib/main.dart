import 'package:choppi_rick/config/router/app_router.dart';
import 'package:choppi_rick/domain/datasouese/episodes_datasoruce.dart';
import 'package:choppi_rick/presentation/blocs/episodios/episodes_cubit.dart';
import 'package:choppi_rick/presentation/blocs/search%20person/search_personaje_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/datasouese/character_datasource.dart';
import 'domain/repository/character_repository.dart';
import 'domain/repository/episode_repository.dart';
import 'presentation/blocs/personajes/personajes_cubit.dart';
import 'presentation/blocs/theme/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repositoryPersonajes = CharacterRepository(CharacterDatasource());
    final repositoryEpisodios = EpisodeRepository(EpisodesDatasource());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => PersonajesCubit(repositoryPersonajes)),
        BlocProvider(create: (_) => EpisodesCubit(repositoryEpisodios)),
        BlocProvider(create: (_) => SearchPersonajeCubit(repositoryPersonajes)),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: state.appTheme.getTheme(),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
