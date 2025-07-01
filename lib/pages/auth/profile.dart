import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:start/shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePag extends StatefulWidget {
  const ProfilePag({super.key});

  @override
  State<ProfilePag> createState() => _ProfilePagState();
}

class _ProfilePagState extends State<ProfilePag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: ListView(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: MemoryImage(base64Decode(userData!.image)),
          ),
          ListTile(title: Text("Name"), subtitle: Text(userData!.fullName)),
          ListTile(title: Text("Email"), subtitle: Text(userData!.email)),
          ListTile(
            title: Text("Lat"),
            subtitle: Text(userData!.lat.toString()),
          ),
          ListTile(
            title: Text("Lng"),
            subtitle: Text(userData!.lng.toString()),
          ),
          ElevatedButton(
            onPressed: () {
              _getCurrentLocation();
            },
            child: Text("Get Location"),
          ),
          ElevatedButton(
            onPressed: () {
              final Uri _url = Uri.parse(
                'https://www.google.com/maps/dir/?api=1&destination=${userData!.lat},${userData!.lng}',
              );
              launchUrl(_url);
            },
            child: Text("Open Location"),
          ),
        ],
      ),
    );
  }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      /*  setState(() {
        _locationMessage = 'Location services are disabled.';
      }); */
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        /*  setState(() {
          _locationMessage = 'Location permissions are denied';
        }); */
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      /*    setState(() {
        _locationMessage =
            'Location permissions are permanently denied, we cannot request permissions.';
      }); */
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print(position.latitude);
    print(position.longitude);
    /*  setState(() {
      _locationMessage =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    }); */
  }
}
