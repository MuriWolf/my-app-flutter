import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/tarefa.dart';
import '../repositories/tarefas_repository.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  var descricaoController = TextEditingController();
  var tarefasRepository = TarefasRepository();
  var _tarefas = <Tarefa>[];
  bool verTarefaNaoConcluida = false;

  @override
  void initState() {
    obterTarefas();
    super.initState();
  }

  Future<void> obterTarefas() async {
    if (verTarefaNaoConcluida) {
      _tarefas = await tarefasRepository.listarNaoCompletas();
    } else {
      _tarefas = await tarefasRepository.listar();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text("Title"),
                  content: TextField(
                    controller: descricaoController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                    TextButton(
                        onPressed: () async {
                          await tarefasRepository.adicionar(
                              Tarefa(descricaoController.text, false));
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: const Text("Confirmar"))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Visualizar apenas os não concluídos"),
                Switch(
                    value: verTarefaNaoConcluida,
                    onChanged: (bool value) {
                      verTarefaNaoConcluida = value;
                      setState(() {});
                      obterTarefas();
                    })
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                      key: Key(tarefa.id),
                      onDismissed: (direction) {
                        tarefasRepository.remover(tarefa.id);
                      },
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                            value: tarefa.concluido,
                            onChanged: (bool value) async {
                              await tarefasRepository.alterar(
                                  tarefa.id, value);
                              setState(() {});
                            }),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
