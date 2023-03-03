import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  var nomeController = TextEditingController();
  var alturaController = TextEditingController();
  bool notificacoes = false;
  bool temaEscuro = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: const InputDecoration(hintText: "Nome"),
              controller: nomeController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: const InputDecoration(hintText: "Altura"),
              controller: alturaController,
              keyboardType: TextInputType.number,
            ),
          ),
          SwitchListTile(
              title: const Text("Permitir notificações"),
              value: notificacoes,
              onChanged: (value) {
                setState(() {
                  notificacoes = value;
                });
              }),
          SwitchListTile(
              title: const Text("Tema escuro"),
              value: temaEscuro,
              onChanged: (value) {
                setState(() {
                  temaEscuro = value;
                });
              }),
          TextButton(onPressed: () {}, child: const Text("Confirmar"))
        ],
      ),
    ));
  }
}
