import 'package:flutter/material.dart';
import 'package:myapp/models/card_details.dart';
import 'package:myapp/pages/card_details_page.dart';
import 'package:myapp/repositories/card_details_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    cardDetails1 = await cardDetailsRepository.get();
    setState(() {});
  }

  CardDetails? cardDetails1;
  var cardDetailsRepository = CardDetailsRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: cardDetails1 == null
            ? const Padding(
              padding: EdgeInsets.all(40),
              child: Center(child: LinearProgressIndicator()),
            )
            : Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardDetailsPage(details: cardDetails1!)));
                      },
                      child: Card(
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  children: [
                                    Image.network(
                                      cardDetails1!.imageUrl,
                                      height: 24,
                                    ),
                                    Text(
                                      cardDetails1!.title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Text(cardDetails1!.text),
                              Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text("Ler mais")))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
