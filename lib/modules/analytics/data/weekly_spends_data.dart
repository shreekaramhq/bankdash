import 'package:bankdash/modules/analytics/domain/spends.dart';

final weeklySpendsData = [
  Spends(
    id: '1',
    date: DateTime.now().subtract(const Duration(days: 6)),
    depositAmout: 4000,
    withdrawalAmount: 500,
  ),
  Spends(
    id: '2',
    date: DateTime.now().subtract(const Duration(days: 5)),
    depositAmout: 5000,
    withdrawalAmount: 2000,
  ),
  Spends(
    id: '3',
    date: DateTime.now().subtract(const Duration(days: 4)),
    depositAmout: 5000,
    withdrawalAmount: 2000,
  ),
  Spends(
    id: '4',
    date: DateTime.now().subtract(const Duration(days: 3)),
    depositAmout: 5000,
    withdrawalAmount: 2000,
  ),
  Spends(
    id: '5',
    date: DateTime.now().subtract(const Duration(days: 2)),
    depositAmout: 3000,
    withdrawalAmount: 2000,
  ),
  Spends(
    id: '6',
    date: DateTime.now().subtract(const Duration(days: 1)),
    depositAmout: 5000,
    withdrawalAmount: 2000,
  ),
  Spends(
    id: '7',
    date: DateTime.now(),
    depositAmout: 5000,
    withdrawalAmount: 2000,
  ),
];
