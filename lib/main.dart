import 'package:eefm/AgivenF.dart';
import 'package:eefm/AgivenP.dart';
import 'package:eefm/PgivenA.dart';
import 'package:eefm/PgivenF.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AgivenG.dart';
import 'FgivenA.dart';
import 'FgivenP.dart';
import 'PgivenG.dart';

void main() {
  runApp(MaterialApp(
    title: 'Time Value Formulas',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  var _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(8, 10, 8, 200),
              child: Text(
                "No need of interest factor table or to memorise those "
                "formula, just select any formula from the drop down below",
                style: TextStyle(fontSize: 30, color: Colors.grey.shade800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 2, 8, 2),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(50.0)),
                child: DropdownButton(
                  isExpanded: true,
                  value: _selectedGender,
                  items: _dropDownItem(),
                  onChanged: (value) {
                    _selectedGender = value;
                    switch (value) {
                      case "Find F Given P":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FgivenP()),
                        );
                        break;
                      case 'Find F Given A':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FgivenA()),
                        );
                        break;
                      case "Find P Given F":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PgivenF()),
                        );
                        break;
                      case 'Find P Given A':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PgivenA()),
                        );
                        break;
                      case "Find A Given P":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AgivenP()),
                        );
                        break;
                      case 'Find A Given F':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AgivenF()),
                        );
                        break;
                      case 'Find A Given G':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AgivenG()),
                        );
                        break;
                      case 'Find P Given G':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PgivenG()),
                        );
                        break;
                    }
                  },
                  hint: Center(
                    child: Text(
                      'Select Formula',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 20,
                          fontFamily: 'OriginalSurfer-Regular'),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = [
      "Find F Given P",
      'Find F Given A',
      "Find P Given F",
      'Find P Given A',
      'Find P Given G',
      "Find A Given P",
      'Find A Given F',
      'Find A Given G',
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}
