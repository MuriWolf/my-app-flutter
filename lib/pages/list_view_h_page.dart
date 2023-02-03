import 'package:flutter/material.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 190,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Image.asset("lib/images/paisagem2.jpg"),
            Image.asset("lib/images/paisagem3.jpg"),
            Image.asset("lib/images/paisagem1.jpg"),
          ],
        ),
      ),
    );
  }
}
