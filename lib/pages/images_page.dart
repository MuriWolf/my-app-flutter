import 'package:flutter/material.dart';
import 'package:myapp/shared/app_iamges.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset("lib/images/paisagem1.jpg"),
          Image.asset(AppImages.paisagem2), // forma alternativa
          Image.asset("lib/images/paisagem3.jpg"),
          // Image.asset("lib/images/user1.png", height: 50,),
        ],
      ),
    );
  }
}
