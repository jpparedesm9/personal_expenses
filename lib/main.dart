import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'New Shirt', amount: 70.99, date: DateTime.now()),
    Transaction(id: 't3', title: 'Cap', amount: 20, date: DateTime.now()),
  ];
  String titleInput;
  String amountInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
                color: Colors.blue,
                child: Text(
                  'CHART!',
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 5),
          ),
          Card(
              elevation: 5,
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                    ),
                    FlatButton(child: Text('Add Transaction'), textColor: Colors.purple, onPressed: () {}),
                  ]))),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
                    child: Text(
                      '\$${tx.amount}',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple),
                    )),
                Column(children: <Widget>[
                  Text(tx.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(DateFormat('yyyy/MM/dd').format(tx.date), style: TextStyle(color: Colors.grey)),
                ])
              ])
                  // Text(tx.title),
                  );
            }).toList(),
          )
        ],
      ),
    );
  }
}