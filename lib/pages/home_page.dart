import 'package:flutter/material.dart';
import 'package:myapp/pages/custom_drawer.dart';
import 'package:myapp/pages/card_page.dart';
import 'package:myapp/pages/list_view_h_page.dart';
import 'package:myapp/pages/list_view_page.dart';
import 'package:myapp/pages/images_page.dart';
import 'package:myapp/pages/tarefas_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int posicaoPagina = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main page"),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: ((value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                }),
                children: const [CardPage(), ImagesPage(), ListViewPage(), ListViewHPage(), TarefasPage()],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "pag2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(label: "pag3", icon: Icon(Icons.person)),
                  BottomNavigationBarItem(label: "pag4", icon: Icon(Icons.image)),
                  BottomNavigationBarItem(label: "pag5", icon: Icon(Icons.pending_actions)),
                ])
          ],
        ),
      ),
    );
  }
}
