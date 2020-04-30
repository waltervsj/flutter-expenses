import '../model/transaction.dart';

class Transactions {
  static List<Transaction> transactionsData = [
      Transaction(
        id: 1,
        title: 'Tênis de corrida',
        value: 1310.76,
        date: DateTime.now(),
      ),
      Transaction(
        id: 2,
        title: 'Conta de luz',
        value: 211.30,
        date: DateTime.now(),
      ),
      Transaction(
        id: 3,
        title: 'Conta de água',
        value: 99,
        date: DateTime.now(),
      ),
      Transaction(
        id: 4,
        title: 'ComboNET',
        value: 567.86,
        date: DateTime.now(),
      ),
    ];
}
