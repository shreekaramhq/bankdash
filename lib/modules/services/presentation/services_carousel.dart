import 'package:flutter/material.dart';

import 'widget/service_card.dart';

class ServicesCarousel extends StatelessWidget {
  const ServicesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: CarouselView(
        itemExtent: MediaQuery.of(context).size.width * 0.7,
        shrinkExtent: MediaQuery.of(context).size.width * 0.7,
        padding: const EdgeInsets.all(20),
        children: const [
          ServiceCard(
            color: Colors.blue,
            title: "Life Insurance",
            subtitle: "Unlimited Protection",
            icon: Icons.sailing,
          ),
          ServiceCard(
            color: Colors.yellow,
            title: "Shopping",
            subtitle: "Buy. Think. Grow.",
            icon: Icons.shopping_basket,
          ),
        ],
      ),
    );
  }
}
