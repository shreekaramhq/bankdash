import 'package:flutter/material.dart';

import '../../domain/dash_card.dart';

const textStyle = TextStyle(color: Colors.white);

class DashCardBlock extends StatelessWidget {
  final DashCard card;
  const DashCardBlock({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Balance",
                style: textStyle,
              ),
              Text(
                "${card.currency}${card.balance.round()}",
                style: textStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("CARDHOLDER", style: textStyle),
                  Text(
                    card.holderName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "VALIDTHRU",
                    style: textStyle,
                  ),
                  Text(
                    "${card.validThru.month}/${card.validThru.year}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            card.cardNumber.toString(),
            style: textStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
