// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  width: 80,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(5),
                  child: Text('\$${transactions[index].amount}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
