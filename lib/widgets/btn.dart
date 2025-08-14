import 'package:calculator/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';

class Btn extends StatefulWidget {
  final CalculatorController controller;
  final String title;
  final Color bgColor;
  final Color textClor;
  final VoidCallback? callback;

  const Btn({
    Key? key,
    required this.title,
    required this.bgColor,
    required this.textClor,
    this.callback,
    required this.controller,
  }) : super(key: key);

  @override
  State<Btn> createState() => _BtnState();
}

class _BtnState extends State<Btn> {
  @override
  Widget build(BuildContext context) {
    print("only button rendered");
    return GestureDetector(
        onTap: (){
          widget.controller.onButtonPressed(widget.title);
          setState(() {
          });
        },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: widget.bgColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.textClor,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
