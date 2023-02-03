import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Image.asset("lib/images/user1.png"),
            title: const Text("Name"),
            subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Olá, tudo bem?"),
                  Text("10:34"),
                ]),
            trailing: PopupMenuButton<String>(onSelected: (opcaoSelecionada) {
              print(opcaoSelecionada);
            }, itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem(value: "opcao1", child: Text("Opcão 1")),
                const PopupMenuItem(value: "opcao2", child: Text("Opcão 2")),
                const PopupMenuItem(value: "opcao3", child: Text("Opcão 3")),
              ];
            }),
          ),
          Image.asset("lib/images/user1.png"),
          Image.asset("lib/images/user1.png"),
          Image.asset("lib/images/user2.png"),
          Image.asset("lib/images/user3.png"),
        ],
      ),
    );
  }
}
