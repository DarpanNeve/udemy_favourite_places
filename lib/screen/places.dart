import 'package:flutter/material.dart';
import 'package:udemy_favourite_places/widget/places_list.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PlacesList(places: []),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Places'),
      ),
    );
  }
}
