
import 'package:uuid/uuid.dart';

const uuid= Uuid();

class Place{
  String id = uuid.v4();
  String name;
  String description;
  String image;

  Place({required this.name, required this.description, required this.image});
}