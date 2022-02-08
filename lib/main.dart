// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:expenses_app/transaction.dart';
import 'package:flutter/material.dart';
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
    Transaction(
        id: '1', title: 'new shoes', amount: 99.99, date: DateTime.now()),
    Transaction(id: '2', title: 'grocery', amount: 25.69, date: DateTime.now()),
    Transaction(
        id: '3', title: 'PS5 game', amount: 140.45, date: DateTime.now()),
    Transaction(
        id: '4', title: 'grocery', amount: 3044.99, date: DateTime.now()),
    Transaction(id: '5', title: 'bills', amount: 999.99, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                child: Text('CHART'),
                width: double.infinity,
                color: Colors.amber[300],
              ),
              elevation: 5,
            ),
            Column(
              children: transactions.map((transaction) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(5),
                        child: Text('\$${transaction.amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transaction.date),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ]),
    );
  }
}
