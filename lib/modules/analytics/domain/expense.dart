import 'package:flutter/material.dart';

enum Category {
  investment,
  entertainment,
  bills,
  others,
}

extension CategoryX on Category {
  String get title {
    switch (this) {
      case Category.investment:
        return 'Investment';
      case Category.entertainment:
        return 'Entertainment';
      case Category.bills:
        return 'Bills';
      case Category.others:
        return 'Others';
    }
  }

  Color get color {
    switch (this) {
      case Category.investment:
        return Colors.green;
      case Category.entertainment:
        return Colors.blue;
      case Category.bills:
        return Colors.red;
      case Category.others:
        return Colors.grey;
    }
  }

  double get radius {
    switch (this) {
      case Category.investment:
        return 120;
      case Category.entertainment:
        return 105;
      case Category.bills:
        return 110;
      case Category.others:
        return 125;
    }
  }
}

class Expense {
  final String id;
  final double amount;
  final Category category;

  Expense({
    required this.id,
    required this.amount,
    required this.category,
  });
}
