import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'noExpenses.dart';
import 'listItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(int) onRemove;

  TransactionList({@required this.transactions, @required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return transactions.isNotEmpty
        ? NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: ListView.builder(
              padding: EdgeInsets.only(right: 5, left: 5),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                var transaction = transactions[index];
                return ListItem(transaction: transaction, onRemove: onRemove);
              },
            ),
          )
        : NoExpenses();
  }
}