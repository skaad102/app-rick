import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/search person/search_personaje_cubit.dart';
import 'list_personajes.dart';

class SearchPersonaje extends StatelessWidget {
  const SearchPersonaje({super.key});

  @override
  Widget build(BuildContext context) {
    final stateList = context.watch<SearchPersonajeCubit>().state;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Personaje'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              SizedBox(height: 20),
              Buscador(),
              SizedBox(height: 20),
              ListSearch(),
            ],
          ),
        ),
        floatingActionButton: stateList.personajes.isEmpty
            ? null
            : FloatingActionButton(
                onPressed: () {
                  context.read<SearchPersonajeCubit>().serchMorePersonajes();
                },
                child: const Icon(Icons.add),
              ));
  }
}

class Buscador extends StatelessWidget {
  const Buscador({
    super.key,
  });

  String? validateInput(String? value) {
    if (value!.length < 3) {
      return 'Ingrese al menos 3 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final texSearch = TextEditingController();
    return Row(children: [
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: TextFormField(
            controller: texSearch,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'Buscar personaje',
            ),
            validator: validateInput,
            onFieldSubmitted: (value) {
              if (value.length < 3) return;
              context.read<SearchPersonajeCubit>().searchPersonaje(value);
            },
          ),
        ),
      ),
      const SizedBox(width: 10),
      IconButton(
        onPressed: () {
          if (texSearch.text.length < 3) return;
          context.read<SearchPersonajeCubit>().searchPersonaje(texSearch.text);
        },
        icon: const Icon(Icons.search),
      ),
    ]);
  }
}

class ListSearch extends StatelessWidget {
  const ListSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchPersonajeCubit, SearchPersonajeState>(
          builder: (context, state) {
        final personajes = state.personajes;
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (personajes.isEmpty) {
          return const Center(
            child: Text('No hay personajes'),
          );
        }
        return ListView.builder(
          itemCount: personajes.length,
          itemBuilder: (context, index) {
            final personaje = personajes[index];
            return CardPersonaje(
              personaje: personaje,
            );
          },
        );
      }),
    );
  }
}
