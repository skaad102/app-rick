import 'package:choppi_rick/config/theme/theme.dart';
import 'package:choppi_rick/domain/entities/personaje.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/personajes/personajes_cubit.dart';

class ListPersonajes extends StatefulWidget {
  const ListPersonajes({super.key});

  @override
  State<ListPersonajes> createState() => _ListPersonajesState();
}

class _ListPersonajesState extends State<ListPersonajes> {
  @override
  void initState() {
    super.initState();
    context.read<PersonajesCubit>().loadCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListPersonajes'),
        ),
        body: BlocBuilder<PersonajesCubit, PersonajesState>(
          builder: (context, state) {
            final personajes = state.personajes;
            if (personajes.isNotEmpty) {
              return ListView.builder(
                itemCount: personajes.length,
                itemBuilder: (context, index) {
                  final personaje = personajes[index];
                  return CardPersonaje(
                    personaje: personaje,
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<PersonajesCubit>().loadCharacters();
          },
          child: const Icon(Icons.add),
        ));
  }
}

class CardPersonaje extends StatelessWidget {
  final Personaje personaje;
  const CardPersonaje({super.key, required this.personaje});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return Card(
      child: ListTile(
        title: Text(personaje.name),
        subtitle: Text(personaje.status,
            style: TextStyle(
                color: theme.getStatusColor(personaje.status.split('.').last))),
        leading: Image.network(personaje.image),
        onTap: () {
          context.push('/personaje_detail/${personaje.id}');
        },
      ),
    );
  }
}
