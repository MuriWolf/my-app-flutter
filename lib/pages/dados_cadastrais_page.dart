import 'package:flutter/material.dart';
import 'package:myapp/repositories/linguagens_repository.dart';
import 'package:myapp/repositories/niveis_repository.dart';
import 'package:myapp/shared/widgets/textLabel.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController nascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  List<String> niveis = [];
  List<String> linguagens = [];
  String nivelSelecionado = "";
  List<String> linguagensSelecionadas = [];
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  double pretencaoSalarial = 1000;
  int tempoExperiencia = 0;
  bool salvando = false;

  List<DropdownMenuItem<int>> returnDropdownItems(int max) {
    var items = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= max; i++) {
      items.add(DropdownMenuItem(value: i, child: Text(i.toString())));
    }
    return items;
  }

  @override
  void initState() {
    niveis = nivelRepository.returnNiveis();
    linguagens = linguagensRepository.returnLinguagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dados cadatráis"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: salvando
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const TextLabel(text: "nome"),
                    TextField(
                      controller: nomeController,
                    ),
                    const TextLabel(text: "Data nascimento"),
                    TextField(
                      readOnly: true,
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000, 1, 1),
                            firstDate: DateTime(1900, 1, 1),
                            lastDate: DateTime(2023, 1, 1));
                        if (date != null) {
                          nascimentoController.text = dataNascimento.toString();
                          dataNascimento = date;
                        }
                      },
                      controller: nascimentoController,
                    ),
                    const TextLabel(text: "Nível de experiência"),
                    Column(
                        children: niveis
                            .map((nivel) => RadioListTile(
                                dense: false,
                                title: Text(nivel),
                                value: nivel.toString(),
                                selected: nivelSelecionado == nivel,
                                groupValue: nivelSelecionado,
                                onChanged: (value) {
                                  setState(() {
                                    nivelSelecionado = value.toString();
                                  });
                                }))
                            .toList()),
                    const TextLabel(text: "Línguagens favoritas"),
                    Column(
                        children: linguagens
                            .map((lang) => CheckboxListTile(
                                title: Text(lang),
                                dense: false,
                                value: linguagensSelecionadas.contains(lang),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value!) {
                                      linguagensSelecionadas.add(lang);
                                    } else {
                                      linguagensSelecionadas.remove(lang);
                                    }
                                  });
                                }))
                            .toList()),
                    const TextLabel(text: "Tempo de experiência  (em anos)"),
                    DropdownButton(
                        value: tempoExperiencia,
                        isExpanded: true,
                        items: returnDropdownItems(50),
                        onChanged: (value) {
                          setState(() {
                            tempoExperiencia = int.parse(value.toString());
                          });
                        }),
                    TextLabel(
                        text:
                            "Pretencão salárial. R\$ ${pretencaoSalarial.round().toString()}"),
                    Slider(
                        min: 0,
                        max: 10000,
                        value: pretencaoSalarial,
                        onChanged: (double value) {
                          setState(() {
                            pretencaoSalarial = value;
                          });
                        }),
                    TextButton(
                        onPressed: () {
                          salvando = false;

                          if (nomeController.text.trim().length < 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "O nome deve conter pelo menos três caracteres")));
                            return;
                          }
                          if (dataNascimento == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Coloque uma data de nascimento")));
                            return;
                          }
                          if (nivelSelecionado == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Escolha um nível de experiência")));
                            return;
                          }
                          if (linguagensSelecionadas.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Escolha pelo menos uma linguagem favorita")));
                            return;
                          }
                          if (pretencaoSalarial == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Escolha uma pretencão salárial maior que 0")));
                            return;
                          }
                          setState(() {
                            salvando = true;
                          });
                          Future.delayed(const Duration(seconds: 3), () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Dados cadastrados com sucesso!")));
                            Navigator.pop(context);
                          });
                        },
                        child: const Text("Enviar dados"))
                  ],
                ),
        ));
  }
}
