import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_favourite_places/widget/image_input.dart';
import 'package:udemy_favourite_places/widget/location_input.dart';

import '../model/place.dart';
import '../provider/user_places.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? image;
void _savePlace(){
  final title = _titleController.text;
  final description = _descriptionController.text;
  if(title.isEmpty || description.isEmpty || image == null){
    return;
  }
  ref.read(userPlacesProvider.notifier).addPlace(Place(
    name: title,
    description: description,
    image: image!,
  ));
  Navigator.of(context).pop();
}
  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 20),
             TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 20),
            ImageInput(
                onImageSelect: (pickedImage) {
                image = pickedImage;
              },
            ),
            const SizedBox(height: 20),
            const LocationInput(),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              onPressed: _savePlace,
              label:const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
