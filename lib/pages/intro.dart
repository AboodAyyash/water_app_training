import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start/pages/home.dart';

//https://www.figma.com/proto/HnCTkXrAnWx4GTNo58afqU/Coffee-Shop-Mobile-App-Design--Community-?node-id=421-1221
class IntorPage extends StatefulWidget {
  const IntorPage({super.key});

  @override
  State<IntorPage> createState() => _IntorPageState();
}

class _IntorPageState extends State<IntorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: BoxDecoration(color: Colors.black)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/bg.jpg",
                height: height / 1.5,
                width: width,
                fit: BoxFit.fill,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Welcome Text",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome Text2",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();

                  preferences.setBool("openIntro", false);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomePage(),
                    ),
                  );
                },
                child: Container(
                  width: width,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFc67c4e),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Get Starded",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
          Column(children: [Text("DAta", style: TextStyle(color: Colors.red))]),
        ],
      ) /* ListView(
        children: [
          Text(width.toString()),
          Text(height.toString()),
          Image.asset("assets/images/bg.jpg", width: 200),
          Image.network(
            "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
          ),
          Container(
            height: 200,
            width: width,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage("assets/images/bg.jpg")),
            ),
            child: ListView(
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Text("1"),
                Text("2"),
                /*    ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Text("uiouiou"),
                    Text("uiouiou"),
                    Text("uiouiou"),
                    Text("uiouiou"),
                    Text("uiouiou"),
                  ],
                ), */
              ],
            ),
          ),
        ],
      ),
     */,
    );
  }
}
