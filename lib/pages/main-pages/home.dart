import 'package:flutter/material.dart';
import 'package:start/controllers/home.dart';
import 'package:start/shared/shared.dart';
import 'package:start/widgets/custom-dialog.dart';

class BNBHomePage extends StatefulWidget {
  const BNBHomePage({super.key});

  @override
  State<BNBHomePage> createState() => _BNBHomePageState();
}

class _BNBHomePageState extends State<BNBHomePage> {
  String location = '';

  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(height: 300, color: Colors.black87),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text("Location", style: TextStyle(color: Colors.white)),

                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      customDataDialog(
                        title: "Select Location",
                        data: locations, // ['Amman', 'Irbid'] ,
                      ).then((onValue) {
                        print(onValue.name);
                        setState(() {
                          location = onValue.name;
                        });
                      });
                    },
                    child: Text(
                      location == '' ? "Select Location" : location,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.asset(
                      "assets/images/bg.jpg",
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        /*  Container(
          width: 200,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/bg.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/bg.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/images/bg.jpg",
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ), */
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < categories.length; i++)
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[i].id;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color:
                          selectedCategory == categories[i].id
                              ? Color(0xFFc67c4e)
                              : Colors.grey.shade300,
                    ),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      categories[i].name,
                      style: TextStyle(
                        fontSize: 20,
                        color:
                            selectedCategory == categories[i].id
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        ListView(
          shrinkWrap: true,
          children: [
            for (int i = 0; i < products.length; i++)
              if (products[i].category == selectedCategory.toString() ||
                  selectedCategory.toString() == "0")
                Text(
                  "${products[i].name}  ${products[i].category}",
                  style: TextStyle(color: Colors.red),
                ),
          ],
        ),
      ],
    );
  }
}

/* String location = '';
Widget homePage() {
  return ListView(
    children: [
      Stack(
        children: [
          Container(height: 400, color: Colors.black87),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text("Location", style: TextStyle(color: Colors.white)),

                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    customDataDialog(
                      title: "Select Location",
                      data: locations, // ['Amman', 'Irbid'] ,
                    ).then((onValue) {
                      print(onValue.name);
                      
                      location = onValue.name;
                    });
                  },
                  child: Text(
                    location == '' ? "Location Name" : location,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text("1"),
      ),
    ],
  );
}
 */
