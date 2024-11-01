import 'package:flutter/material.dart';

import '../data/cards_list.dart';
import 'widgets/dash_card_block.dart';

class CardsViewer extends StatelessWidget {
  const CardsViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "My Cards",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: CarouselView(
            itemExtent: 320,
            shrinkExtent: 320,
            itemSnapping: true,
            padding: const EdgeInsets.only(left: 20),
            children:
                cardsList.map((card) => DashCardBlock(card: card)).toList(),
          ),
        ),
      ],
    );
  }
}
