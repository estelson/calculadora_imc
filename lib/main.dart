import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    _infoText = "Informe seus dados!";
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.5) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <= 24.9) {
        _infoText = "Peso normal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 25 && imc <= 29.9) {
        _infoText = "Sobrepeso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30 && imc <= 34.9) {
        _infoText = "Obesidade grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 35 && imc <= 39.9) {
        _infoText = "Obesidade grau II (${imc.toStringAsPrecision(3)})";
      } else {
        if (imc >= 40) {
          _infoText = "Obesidade grau III (${imc.toStringAsPrecision(3)})";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            onPressed: _resetFields,
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.person_outline,
              size: 120,
              color: Colors.green,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Peso (Kg)",
                labelStyle: TextStyle(color: Colors.green),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
              controller: weightController,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.green)),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
              controller: heightController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                _infoText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
