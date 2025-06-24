import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class NotifcationPage extends StatefulWidget {
  const NotifcationPage({super.key});

  @override
  State<NotifcationPage> createState() => _NotifcationPageState();
}

class _NotifcationPageState extends State<NotifcationPage> {
  String _locationMessage = "Press the button to get your location";

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = 'Location services are disabled.';
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = 'Location permissions are denied';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage =
            'Location permissions are permanently denied, we cannot request permissions.';
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _locationMessage =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });
  }

  File? _image;
  final ImagePicker _picker = ImagePicker();

  void _pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      print(pickedFile.path);
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _pickImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _image != null
              ? Image.file(_image!, height: 200, width: 200, fit: BoxFit.cover)
              : const Text("No image selected"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _pickImageFromGallery,
                child: const Text("Pick from Gallery"),
              ),
              ElevatedButton(
                onPressed: _pickImageFromCamera,
                child: const Text("Pick from Camera"),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(_locationMessage),
          ),
        ],
      ),
    );
  }
}
