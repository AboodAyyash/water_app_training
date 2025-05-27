import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Image.asset("assets/images/bg.jpg", width: 200),
          Image.network(
            "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
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
    );
  }
}
