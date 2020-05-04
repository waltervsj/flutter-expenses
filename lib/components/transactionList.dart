import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({@required this.transactions});

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
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[300],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.deepPurple, width: 2)
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        maxRadius: 28,
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.only(right: 8, left: 8),
                            child: Text(
                              '\$ ${transaction.value.toStringAsFixed(2)}',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction.title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(DateFormat('dd MMMM y', 'pt-BR')
                        .format(transaction.date)),
                  ),
                );
              },
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'No expenses yet',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.sentiment_dissatisfied,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17.5),
                  child: Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          );
  }
}
