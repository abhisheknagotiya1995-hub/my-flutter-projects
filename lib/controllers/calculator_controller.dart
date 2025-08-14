import 'package:calculator/models/calculator_model.dart';


class CalculatorController {
  final CalculatorModel _model = CalculatorModel();

  String get output => _model.output;
  String get history => _model.history;

  void onButtonPressed(String buttonText) {
    switch (buttonText) {
      case "C":
        _model.clear();
        break;
      case "⌫":
        _model.delete();
        break;
      case "+/-":
        _model.toggleSign();
        break;
      case "%":
        _model.percentage();
        break;
      case "+":
      case "-":
      case "×":
      case "÷":
        _model.setOperand(buttonText);
        break;
      case "=":
        _model.calculate();
        break;
      case ".":
        _model.addDecimal();
        break;
      default:
        _model.setOutput(buttonText);
    }
  }
}