import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String inputValue = "";
  String calcValue = "";

  String operator = "";
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 6.8;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 140),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      inputValue,
                      style: TextStyle(color: Colors.white, fontSize: 70),
                    )),
                Center(
                  child: Row(
                    children: [
                      calcButton("7", Colors.white54, size),
                      calcButton("8", Colors.white54, size),
                      calcButton("9", Colors.white54, size),
                      calcButton("/", Colors.orange, size),
                    ],
                  ),
                ),
                Row(
                  children: [
                    calcButton("4", Colors.white54, size),
                    calcButton("5", Colors.white54, size),
                    calcButton("6", Colors.white54, size),
                    calcButton("*", Colors.orange, size),
                  ],
                ),
                Row(
                  children: [
                    calcButton("1", Colors.white54, size),
                    calcButton("2", Colors.white54, size),
                    calcButton("3", Colors.white54, size),
                    calcButton("-", Colors.orange, size),
                  ],
                ),
                Row(
                  children: [
                    calcButton("0", Colors.white54, size),
                    calcButton(".", Colors.white54, size),
                    calcButton("=", Colors.orange, size),
                    calcButton("+", Colors.orange, size),
                  ],
                )
              ],
            ),
            calcButton("Clear", Colors.black, size)
          ],
        ),
      ),
    );
  }

  Widget calcButton(String text, Color bgColor, double size) {
    return InkWell(
      onTap: () {
        if (text == "Clear") {
          setState(() {
            inputValue = "";
            calcValue = "";
            operator = "";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            calcValue = inputValue;
            inputValue = "";

            operator = text;
          });
        } else if (text == "=") {
          setState(() {
            double calc = double.parse(calcValue);
            double input = double.parse(inputValue);

            if (operator == "+") {
              inputValue = (calc + input).toString();
            } else if (operator == "-") {
              inputValue = (calc - input).toString();
            } else if (operator == "*") {
              inputValue = (calc * input).toString();
            } else if (operator == "/") {
              inputValue = (calc / input).toString();
            }
          });
        } else {
          setState(() {
            inputValue = inputValue + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
