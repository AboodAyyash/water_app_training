import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:start/second.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color numberColor = Colors.grey.shade300;
  Color opColor = Colors.black;
  Color numberValueColor = Colors.black;
  Color opValueColor = Colors.white;
  List<CalcButton> buttons = [];
  String num1 = "";
  String num2 = "";
  String opResult = "";
  double total = 0;
  String op = "";

  void initData() {
    buttons = [
      CalcButton(
        color: numberColor,
        valueColor: numberValueColor,
        isOp: false,
        value: "1",
      ),
      CalcButton(
        color: numberColor,
        valueColor: numberValueColor,
        isOp: false,
        value: "2",
      ),
      CalcButton(
        color: numberColor,
        valueColor: numberValueColor,
        isOp: false,
        value: "3",
      ),
      CalcButton(
        color: opColor,
        valueColor: opValueColor,
        isOp: true,
        value: "+",
      ),
      CalcButton(
        color: opColor,
        valueColor: opValueColor,
        isOp: true,
        value: "-",
      ),
      CalcButton(
        color: opColor,
        valueColor: opValueColor,
        isOp: true,
        value: "=",
      ),
    ];
    print(buttons.length);
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  String tfValue1 = "";
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: controller1,
                    onChanged: (value) {
                      print(value);
                      tfValue1 = value;
                    },
                    validator: (value) {
                      if (value!.length < 8) {
                        return "Please Fill";
                      }
                    },
                    //onSubmitted: (value) {},
                    onTap: () {},
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),

                      suffix: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d*\.?\d{0,1}$'),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: controller2,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d*\.?\d{0,1}$'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(controller1.text);
              print(controller2.text);
              if (formKey.currentState!.validate()) {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder:
                        (BuildContext context) =>
                            SecondPage(password: controller1.text),
                  ),
                );
              }
            },
            child: Text("+"),
          ),
          Text("$total"),
          Wrap(
            children: [
              for (int i = 0; i < buttons.length; i++)
                customButton(
                  onPressed: () {
                    calcuate(buttons[i]);
                  },
                  value: buttons[i].value,
                  color: buttons[i].color,
                  valueColor: buttons[i].valueColor,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget customButton({
    Color color = Colors.grey,
    required String value,
    required onPressed,
    valueColor,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Text(
          value,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ),
    );
  }

  void calcuate(CalcButton value) {
    setState(() {
      if (value.isOp) {
        if (op == "") op = value.value;
        if (value.value == "=") {
          if (op == "+") {
            total = double.parse(num1) + double.parse(num2);
          } else if (op == '-') {
            total = double.parse(num1) - double.parse(num2);
          }
        }
      } else {
        if (op == "") {
          num1 += value.value;
        } else {
          num2 += value.value;
        }
      }
    });
  }
}

class CalcButton {
  String value;
  Color color;
  Color valueColor;
  bool isOp;
  CalcButton({
    required this.value,
    required this.color,
    required this.valueColor,
    required this.isOp,
  });
}
