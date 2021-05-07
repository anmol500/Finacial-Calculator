import 'dart:math';

import 'package:flutter/material.dart';

class PgivenF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: AppBody(),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  var solution = ['', ''];
  //controllers of TextFields
  TextEditingController principle = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController rate = TextEditingController();

  bool _validatePrinciple = false;

  bool _validateTime = false;

  bool _validateRate = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 18,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Principle Value is: ${solution[0]}",
                style: TextStyle(
                  fontFamily: 'ZenDots-Regular',
                  fontSize: 30,
                ),
              ),
              Text("factor is: ${solution[1]}"),
              SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: principle,
                  style: TextStyle(fontSize: 25),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                      labelText: 'Future Amount',
                      errorText:
                          _validatePrinciple ? 'Field can\'t be empty' : null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: rate,
                    style: TextStyle(fontSize: 25),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                        labelText: 'Interest Rate',
                        errorText:
                            _validateRate ? 'Field can\'t be empty' : null)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: time,
                  style: TextStyle(fontSize: 25),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                    labelText: 'Number Of Years',
                    errorText: _validateTime ? 'Field can\'t be empty' : null,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _validatePrinciple =
                          principle.text.isEmpty ? true : false;
                      _validateRate = rate.text.isEmpty ? true : false;
                      _validateTime = time.text.isEmpty ? true : false;
                      solution = formula(double.parse(principle.text),
                          double.parse(rate.text), double.parse(time.text));
                    });
                  },
                  child: Text('Calculate'))
            ],
          ),
        ),
        Expanded(flex: 1, child: Text('Made By Anmol Pandey'))
      ],
    );
  }
}

// formules
formula(double p, double i, double n) {
  var k = pow(1 + (i / 100), n);

  return roundDouble((p * (1 / k)), 3).toString();
}

//decimal rounder function
double roundDouble(double value, int places) {
  var mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
