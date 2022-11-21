import 'package:calculadora/components/calculator_form.dart';
import 'package:calculadora/components/operation_log.dart';
import 'package:calculadora/models/calculator_form_data.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  List<OperationLog> logs = [];

  void calculate(CalculatorFormData data) {
    String result = data.operation.operate(data.value1, data.value2);
    setState(() {
      logs.insert(0, OperationLog(data: data, result: result));
    });
  }

  void resetLogs() {
    setState(() {
      logs.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          centerTitle: true,
          actions: const <Widget>[
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: resetLogs,
          tooltip: 'Limpar histórico',
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          child: const Icon(CupertinoIcons.trash),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: CalculatorForm(
                  submit: calculate,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFCCCCCC)),
                  ),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(20),
                    children: [...logs],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
