import 'package:go_router/go_router.dart';

import '../../presentation/pages/export.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: "/home",
    builder: (context, state) => const HomePage(),
    routes: [
      GoRoute(
        path: "list_personajes",
        builder: (context, state) => const ListPersonajes(),
      ),
      GoRoute(
        path: "list_episodios",
        builder: (context, state) => const ListEpisodios(),
      ),
      GoRoute(
        path: "search",
        builder: (context, state) => const SearchPersonaje(),
      ),
    ],
  ),
  GoRoute(
      path: "/personaje_detail/:id",
      builder: (context, state) {
        final id = state.pathParameters["id"]!;
        return DetallesPersonaje(id: id);
      }),
]);
