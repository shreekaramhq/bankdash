import 'package:flutter/material.dart';

final data = [
  {"name": "Apple", "price": "\$120", "return": "5%"},
  {"name": "Tesla", "price": "\$800", "return": "10%"},
  {"name": "Google", "price": "\$2000", "return": "15%"},
  {"name": "Amazon", "price": "\$3000", "return": "20%"},
  {"name": "Facebook", "price": "\$400", "return": "25%"},
];

class TrendingStocks extends StatelessWidget {
  const TrendingStocks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Trending Stocks",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(12),
          child: Table(
            border: const TableBorder(),
            children: [
              const TableRow(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                children: [
                  Text(
                    "Sl. No.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Return",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              for (var i = 0; i < data.length; i++)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: Text((i + 1).toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: Text(data[i]["name"]!),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: Text(data[i]["price"]!),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      child: Text(data[i]["return"]!),
                    ),
                  ],
                ),
            ],
          ),
        )
      ],
    );
  }
}
