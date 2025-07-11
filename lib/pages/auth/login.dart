import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start/apis/home.dart';
import 'package:start/models/user.dart';
import 'package:start/pages/auth/profile.dart';
import 'package:start/shared/shared.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  String email = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String image = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Email";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      }
                      if (value.length < 6) {
                        return "Password must be atleast 6 characters";
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed:
                        loading
                            ? () {}
                            : () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ).then((onValue) async {
                                  print(onValue);
                                  setState(() {
                                    loading = false;
                                  });
                                  if (onValue['status'] != 200) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          onValue['body']['status_message'],
                                        ),
                                      ),
                                    );
                                  } else {
                                    SharedPreferences preferences =
                                        await SharedPreferences.getInstance();

                                    userId = onValue['body']['userid'];

                                    preferences.setString(
                                      "userId",
                                      userId.toString(),
                                    );
                                    Navigator.pushReplacement<void, void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder:
                                            (BuildContext context) =>
                                                const ProfilePag(),
                                      ),
                                    );
                                  }
                                });
                              } else {
                                print("invalid");
                              }
                            },
                    child:
                        loading ? CircularProgressIndicator() : Text('Login'),
                  ),
                  /* 
                  if (image != '')
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: MemoryImage(base64Decode(image)),
                      /* Image.memory(
                        base64Decode(image),
                        fit: BoxFit.cover,
                      ), */
                    ), */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
