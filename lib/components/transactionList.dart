
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final transaction = transactions[index];
          return Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'R\$ ${transaction.value.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 13,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                      child: Container(
                        child: Text(
                          transaction.title,
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 5),
                      child: Container(
                        child: Text(
                          DateFormat('d MMMM y', 'pt-BR')
                              .format(transaction.date),
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 11
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
