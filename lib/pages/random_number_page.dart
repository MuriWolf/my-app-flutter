import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({super.key});

  @override
  State<RandomNumberPage> createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  @override
  void initState() {
    // TODO: implement initState
    carregarDados();
  }

  final String RANDOM_NUMBER_KEY = "numeroAleatorioGerado";
  final String TIMES_CLICKED_KEY = "timesClicked";

  int? numeroGerado;
  int? timesClicked = 0;

  void carregarDados() async {
    final storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(RANDOM_NUMBER_KEY);
      timesClicked = storage.getInt(TIMES_CLICKED_KEY);
    });
  }

  void setNumeroAleatorio() async {
    final storage = await SharedPreferences.getInstance();
    setState(() {
      Random random = Random();
      numeroGerado = random.nextInt(1000);
      timesClicked = timesClicked! + 1;
      storage.setInt(RANDOM_NUMBER_KEY, numeroGerado!);
      storage.setInt(TIMES_CLICKED_KEY, timesClicked!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(numeroGerado != null ? numeroGerado.toString() : ""),
          Text(timesClicked != null
              ? "Vezes clicado: $timesClicked"
              : "Nenhuma vez clicado"),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: setNumeroAleatorio,
        child: const Icon(Icons.add),
      ),
    );
  }
}
