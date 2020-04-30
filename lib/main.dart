import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/transactionUser.dart';
import './views/appHeader.dart';

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
      theme: ThemeData(canvasColor: Colors.transparent),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Despesas pessoais'),
      ),
      drawer: AppHeader(),
      body: Column(
        children: <Widget>[
          Card(
            child: Text('Gráfico'),
          ),
          TransactionUser(),
        ],
      ),
    );
  }
}
