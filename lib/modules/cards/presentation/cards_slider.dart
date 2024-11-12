import "dart:math" as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../data/cards_list.dart';
import 'widgets/dash_card_block.dart';

class CardsSlider extends StatelessWidget {
  const CardsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "My Cards",
              style: TextStyle(
                fontSize: 18,
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
        const SizedBox(height: 12),
        Expanded(
          child: PageView.builder(
            padEnds: false,
            controller: PageController(
              viewportFraction: ResponsiveValue(
                context,
                conditionalValues: [
                  const Condition.smallerThan(breakpoint: 540, value: 0.9),
                  const Condition.largerThan(breakpoint: 540, value: 0.5),
                ],
                defaultValue: 0.85,
              ).value,
            ),
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
    );
  }
}
