import 'package:flutter/material.dart';
import '../mock/transactions.dart';
import '../model/transaction.dart';
import './transactionForm.dart';
import './transactionList.dart';
import 'transactionForm.dart';
import 'transactionList.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  _addTransaction(String titulo, double valor) {
    final transaction = new Transaction(
      id: Transactions.transactionsData.length + 1,
      title: titulo,
      value: valor,
      date: DateTime.now(),
    );

    setState(() {
      Transactions.transactionsData.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(
          transactions: Transactions.transactionsData,
        ),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
