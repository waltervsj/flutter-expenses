import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key key,
    @required this.transaction,
    @required this.onRemove,
  }) : super(key: key);

  final Transaction transaction;
  final void Function(int p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.deepPurple,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            maxRadius: 28,
            child: FittedBox(
              child: Padding(
                padding: EdgeInsets.only(right: 8, left: 8),
                child: Text(
                  '\$ ${transaction.value.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle:
            Text(DateFormat('dd MMMM y', 'pt-BR').format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ? FlatButton.icon(
                onPressed: () => this.onRemove(transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Excluir'),
                textColor: Colors.red[300],
              )
            : IconButton(
                onPressed: () => this.onRemove(transaction.id),
                icon: Icon(Icons.delete),
                color: Colors.red[300],
              ),
      ),
    );
  }
}
