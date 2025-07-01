import 'package:flutter/material.dart';
import 'package:start/models/user.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

String baseURL = "http://falafelalbalad.com/api";

User? userData;



//http://falafelalbalad.com/api/login post 200

/* 
{

    "email": "kholoudammoura1332@gmail.com",
    "password": "123456"
    }
 */

//http://falafelalbalad.com/api/users post 201

/* 
{

    "email": "kholoudammoura12@gmail.com",
    "password": "123456",
    "full_name": "kholoud ammoura",
    "image": "",
    "lat": "31.978900",
    "lng": "35.900641"
}
*/


//http://falafelalbalad.com/api/users?id=1 get. 200