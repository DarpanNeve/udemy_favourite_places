
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:udemy_favourite_places/model/place.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _locationData;
  var _isLoading = false;
void  _getCurrentLocation()async{

  Location location = Location();

  bool serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }setState(() {
    _isLoading = true;
  });


  _locationData = await location.getLocation();
  setState(() {
    _isLoading = false;
  });
  print(_locationData.latitude);
  print(_locationData.longitude);

}
  @override
  Widget build(BuildContext context) {
  Widget previewContent = _isLoading
      ? const CircularProgressIndicator()
      : Text(
          'Location Preview',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        );
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
          ),
          child: previewContent
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
            ),
          ],
        ),
      ],
    );
  }
}
