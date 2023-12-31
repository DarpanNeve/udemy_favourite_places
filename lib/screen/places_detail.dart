import 'package:flutter/material.dart';

import '../model/place.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Column(
        children: [
          CircleAvatar(
            maxRadius: double.infinity,
            minRadius: 100,
            backgroundImage: FileImage(place.image),
          ),
          Text(
            place.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),

          Text(place.description),
        ],
      ),
    );
  }
}
