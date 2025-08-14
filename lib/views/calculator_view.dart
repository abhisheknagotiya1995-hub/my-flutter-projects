import 'package:calculator/controllers/calculator_controller.dart';
import 'package:calculator/widgets/btn.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final CalculatorController _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    print('calculator page randered');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _controller.history,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _controller.output,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              _buildButton("C", Colors.grey),
              _buildButton("⌫", Colors.grey),
              _buildButton("%", Colors.grey),
              _buildButton("÷", Colors.orange),
              _buildButton("7", Colors.grey.shade800),
              _buildButton("8", Colors.grey.shade800),
              _buildButton("9", Colors.grey.shade800),
              _buildButton("×", Colors.orange),
              _buildButton("4", Colors.grey.shade800),
              _buildButton("5", Colors.grey.shade800),
              _buildButton("6", Colors.grey.shade800),
              _buildButton("-", Colors.orange),
              _buildButton("1", Colors.grey.shade800),
              _buildButton("2", Colors.grey.shade800),
              _buildButton("3", Colors.grey.shade800),
              _buildButton("+", Colors.orange),
              _buildButton("+/-", Colors.grey.shade800),
              _buildButton("0", Colors.grey.shade800),
              _buildButton(".", Colors.grey.shade800),
              _buildButton("=", Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _controller.onButtonPressed(text);
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color == Colors.grey ? Colors.black : Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
