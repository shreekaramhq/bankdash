import 'package:flutter/material.dart';

import '../data/cards_list.dart';
import 'widgets/dash_card_block.dart';

class CardsListView extends StatelessWidget {
  const CardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("My Cards"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: cardsList.length,
        itemBuilder: (context, index) {
          final card = cardsList[index];
          return DashCardBlock(card: card);
        },
      ),
    );
  }
}
