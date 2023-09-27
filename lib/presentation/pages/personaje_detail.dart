import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/personajes/personajes_cubit.dart';

class DetallesPersonaje extends StatelessWidget {
  final String id;
  const DetallesPersonaje({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del personaje'),
      ),
      body: FutureBuilder(
        future: context.read<PersonajesCubit>().loadCharacter(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final personaje = snapshot.data!;
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Text(
                personaje.name,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  personaje.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Status: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    personaje.status.split('.').last,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Species: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    personaje.species.split('.').last,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ]),
          );
        },
      ),
    );
  }
}
