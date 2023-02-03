import 'package:flutter/material.dart';

import '../models/card_details.dart';

class CardDetailsPage extends StatefulWidget {
  final CardDetails details;
  const CardDetailsPage({super.key, required this.details});

  @override
  State<CardDetailsPage> createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.details.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close)),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Image.network(
                        widget.details.imageUrl,
                        height: 24,
                      ),
                      Text(
                        widget.details.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Text(widget.details.text)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
