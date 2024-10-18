import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../domain/dash_card.dart';
import 'widgets/dash_card_block.dart';

final cardsList = [
  DashCard(
    id: "1",
    holderName: "Shreekaram",
    validThru: DateTime.now(),
    cardNumber: "1234 5678 9012 3456",
    cardType: "MasterCard",
    balance: 1000,
  ),
  DashCard(
    id: "2",
    holderName: "Youtube",
    validThru: DateTime.now(),
    cardNumber: "1234 5678 9012 3456",
    cardType: "MasterCard",
    balance: 1000,
  ),
];

class CardsSlider extends StatelessWidget {
  const CardsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 250,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My Cards",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                  onPressed: () {
                    context.go('/cards');
                  },
                  child: const Text("See All")),
            ],
          ),
          Expanded(
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.85),
              padEnds: false,
              itemCount: cardsList.length,
              itemBuilder: (context, index) {
                final card = cardsList[index];
                return DashCardBlock(card: card);
              },
            ),
          ),
        ],
      ),
    );
  }
}
