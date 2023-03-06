import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late SharedPreferences storage;
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  var nomeController = TextEditingController();
  var alturaController = TextEditingController();
  bool notificacoes = false;
  bool temaEscuro = false;

  final String NOME_KEY = "NOME_KEY";
  final String ALTURA_KEY = "ALTURA_KEY";
  final String RECEBER_NOTIFICACOES_KEY = "RECEBER_NOTIFICACOES_KEY";
  final String TEMA_ESCURO_KEY = "TEMA_ESCURO_KEY";

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeController.text = storage.getString(NOME_KEY) ?? "";
      alturaController.text = (storage.getDouble(ALTURA_KEY) ?? 0).toString();
      notificacoes = storage.getBool(RECEBER_NOTIFICACOES_KEY) ?? false;
      temaEscuro = storage.getBool(TEMA_ESCURO_KEY) ?? false;
    });
  }

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
          TextButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                try {
                  await storage.setDouble(
                      ALTURA_KEY, double.parse(alturaController.text));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(milliseconds: 850),
                      content: Text("Digite uma altura válida!")));
                  return;
                }
                await storage.setString(NOME_KEY, nomeController.text);
                await storage.setBool(RECEBER_NOTIFICACOES_KEY, notificacoes);
                await storage.setBool(TEMA_ESCURO_KEY, temaEscuro);
                Navigator.pop(context);
              },
              child: const Text("Confirmar"))
        ],
      ),
    ));
  }
}
