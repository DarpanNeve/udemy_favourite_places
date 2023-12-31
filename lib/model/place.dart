
import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid= Uuid();
class PlaceLocation{
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocation({required this.latitude, required this.longitude, required this.address});
}
class Place{
  String id = uuid.v4();
  String name;
  String description;
  File image;

  Place({required this.name, required this.description, required this.image});
}