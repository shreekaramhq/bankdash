import "dart:math" as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/cards_list.dart';
import 'widgets/dash_card_block.dart';

class CardsSlider extends StatelessWidget {
  const CardsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.only(left: 20),
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
                    context.push('/cards');
                  },
                  child: const Text("See All")),
            ],
          ),
          Expanded(
            child: PageView.builder(
              padEnds: false,
              controller: PageController(viewportFraction: 0.85),
              itemCount: math.min(cardsList.length, 3),
              itemBuilder: (context, index) {
                final card = cardsList[index];
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: DashCardBlock(card: card),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
