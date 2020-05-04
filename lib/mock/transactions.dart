import 'dart:math';

import '../model/transaction.dart';

class Transactions {
  static List<Transaction> transactionsData = List<Transaction>.generate(
    Random().nextInt(100),
    (index) => new Transaction(
      id: index + 1,
      title: 'Transaction $index',
      value: Random().nextDouble() * Random().nextInt(1000),
      date: DateTime.now().subtract(
        Duration(
          days: Random().nextInt(7),
        ),
      ),
    ),
  ).toList();

  static List<Transaction> get recentTransactions {
    return transactionsData.where((transaction) {
      return transaction.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }
}
