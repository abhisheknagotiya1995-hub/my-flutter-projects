class CalculatorModel {
  String _output = "0";
  String _history = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";
  bool _shouldResetOutput = false;

  String get output => _output;
  String get history => _history;

  void setOutput(String value) {
    if (_shouldResetOutput) {
      _output = "0";
      _shouldResetOutput = false;
    }
    
    if (_output == "0" && value != ".") {
      _output = value;
    } else {
      _output += value;
    }
  }

  void clear() {
    _output = "0";
    _history = "";
    _num1 = 0;
    _num2 = 0;
    _operand = "";
  }

  void delete() {
    if (_output.length > 1) {
      _output = _output.substring(0, _output.length - 1);
    } else {
      _output = "0";
    }
  }

  void setOperand(String operand) {
    if (_output == "0" && _history.isNotEmpty) {
      _operand = operand;
      _history = _history.substring(0, _history.length - 2) + " $operand ";
      return;
    }
    
    _num1 = double.parse(_output);
    _operand = operand;
    _history = "$_output $operand ";
    _shouldResetOutput = true;
  }

  void calculate() {
    if (_operand.isEmpty) return;
    
    _num2 = double.parse(_output);
    _history += _output;
    
    switch (_operand) {
      case "+":
        _output = (_num1 + _num2).toString();
        break;
      case "-":
        _output = (_num1 - _num2).toString();
        break;
      case "×":
        _output = (_num1 * _num2).toString();
        break;
      case "÷":
        _output = (_num1 / _num2).toString();
        break;
    }
    
    // Remove decimal if it's .0
    if (_output.endsWith(".0")) {
      _output = _output.substring(0, _output.length - 2);
    }
    
    _operand = "";
    _shouldResetOutput = true;
  }

  void percentage() {
    final value = double.parse(_output);
    _output = (value / 100).toString();
    if (_output.endsWith(".0")) {
      _output = _output.substring(0, _output.length - 2);
    }
  }

  void toggleSign() {
    if (_output.startsWith("-")) {
      _output = _output.substring(1);
    } else if (_output != "0") {
      _output = "-$_output";
    }
  }

  void addDecimal() {
    if (_shouldResetOutput) {
      _output = "0";
      _shouldResetOutput = false;
    }
    
    if (!_output.contains(".")) {
      _output += ".";
    }
  }
}