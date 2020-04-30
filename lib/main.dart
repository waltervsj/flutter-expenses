import 'package:expenses/components/transactionForm.dart';
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
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        canvasColor: Colors.transparent,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            // fontFamily: 'OpenSans',
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
  Future<void> _addTransaction(String titulo, double valor) async {
    final transaction = new Transaction(
      id: Transactions.transactionsData.length + 1,
      title: titulo,
      value: valor,
      date: DateTime.now(),
    );

    setState(() {
      Transactions.transactionsData.add(transaction);
    });

    Navigator.of(context).pop();
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
          'Despesas pessoais',
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
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Grafic(),
              Column(
                children: <Widget>[
                  Card(
                    elevation: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue[100],
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: Offset(2, 5),
                          ),
                        ],
                      ),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await _addTransaction(
                              'Updated ${Transactions.transactionsData.length + 1}',
                              0);
                        },
                        child: TransactionList(
                          transactions: Transactions.transactionsData,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[300],
        splashColor: Colors.purple,
        child: Icon(Icons.add_box),
        onPressed: () => {
          _openTransactionFormModal(context),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
