import 'package:flutter/material.dart';

import '../model/place.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text('No places added yet'),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return Card(
          child: ListTile(
            leading: Image.network(place.image),
            title: Text(
              place.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            subtitle: Text(place.description),
          ),
        );
      },
    );
  }
}
