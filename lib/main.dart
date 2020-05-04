import 'components/transactionForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/transactionList.dart';
import 'components/grafic.dart';
import './views/appHeader.dart';
import 'mock/transactions.dart';
import 'model/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurple,
        fontFamily: 'Quicksand',
        canvasColor: Colors.transparent,
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 18,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _addTransaction(
    String titulo,
    double valor,
    DateTime date, [
    bool doPop = true,
  ]) async {
    final transaction = new Transaction(
      id: Transactions.transactionsData.length + 1,
      title: titulo,
      value: valor,
      date: date,
    );

    setState(() {
      Transactions.transactionsData.add(transaction);
    });

    if (doPop) Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Personal expenses',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => {
              _openTransactionFormModal(context),
            },
          ),
        ],
      ),
      drawer: AppHeader(),
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Grafic(Transactions.recentTransactions),
          ),
          Flexible(
            flex: 6,
            child: TransactionList(
              transactions: Transactions.transactionsData,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        splashColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: () => {
          _openTransactionFormModal(context),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
