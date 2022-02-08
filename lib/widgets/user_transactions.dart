import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: '1', title: 'new shoes', amount: 99.99, date: DateTime.now()),
    Transaction(id: '2', title: 'grocery', amount: 25.69, date: DateTime.now()),
    Transaction(
        id: '3', title: 'PS5 game', amount: 140.45, date: DateTime.now()),
    Transaction(
        id: '4', title: 'grocery', amount: 3044.99, date: DateTime.now()),
    Transaction(id: '5', title: 'bills', amount: 999.99, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions),
    ]);
  }
}
