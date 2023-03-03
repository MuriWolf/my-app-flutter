import 'package:flutter/material.dart';
import 'package:myapp/pages/configuracoesPage.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/pages/random_number_page.dart';
import 'dados_cadastrais_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple.shade300),
            currentAccountPicture: InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    context: context,
                    builder: (BuildContext bc) {
                      return Wrap(children: const [
                        ListTile(
                          title: Text("Camera"),
                          leading: Icon(Icons.camera),
                        ),
                        ListTile(
                          title: Text("Galeria"),
                          leading: Icon(Icons.photo_album),
                        ),
                      ]);
                    });
              },
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://whatifgaming.com/wp-content/uploads/2021/10/661ece4c9340138ac3a170db0d86f25f.jpg"),
              ),
            ),
            accountName: const Text("Murillo P"),
            accountEmail: const Text("teste@teste.com")),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(
                  onTap: () => {
                        Navigator.pop(context),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DadosCadastraisPage(),
                            ))
                      },
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.person),
                          Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Text("Dados cadastráis"),
                          ),
                        ],
                      ))),
              const Divider(),
              InkWell(
                  onTap: () => {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            context: context,
                            builder: (BuildContext bc) {
                              return Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      child: const Text(
                                        "Termos de uso e privacidade",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                    )
                                  ],
                                ),
                              );
                            })
                      },
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.question_mark),
                          Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Text("Termos de uso e privacidade"),
                          ),
                        ],
                      ))),
              const Divider(),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (bc) => const ConfiguracoesPage()));
                  },
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.change_circle),
                          Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Text("Configurações"),
                          ),
                        ],
                      ))),
              const Divider(),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (bc) => const RandomNumberPage()));
                  },
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.numbers),
                          Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Text("Random number"),
                          ),
                        ],
                      ))),
              const Divider(),
              InkWell(
                  onTap: () => {
                        showDialog(
                            context: context,
                            builder: (BuildContext bc) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                title: const Text("Saída"),
                                content: Wrap(
                                  children: const [
                                    Text("Deseja realmente sair?")
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Não")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const loginPage()));
                                      },
                                      child: const Text("Sim")),
                                ],
                              );
                            })
                      },
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      width: double.infinity,
                      child: Row(
                        children: const [
                          Icon(Icons.exit_to_app),
                          Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Text("Sair"),
                          ),
                        ],
                      ))),
            ],
          ),
        ),
      ],
    ));
  }
}
