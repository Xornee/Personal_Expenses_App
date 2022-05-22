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
    Transaction(
      id: 't1',
      amount: 21.41,
      title: "Frog Store :D",
      date: DateTime.now(),
    ),
    Transaction(
      id: 'A4',
      amount: 9.99,
      title: "Vending Machine",
      date: DateTime.now(),
    ),
    Transaction(
      id: 'b6',
      amount: 119.99,
      title: "Nike Store USA",
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: Container(
              width: double.infinity,
              child: Text("Chart"),
            ),
            elevation: 5,
          ),
          Card(
            child: Column(
              children: <Widget>[
                TextField(),
                TextField(),
              ],
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                elevation: 10,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 25, 20, 25),
                      constraints: BoxConstraints(
                        minHeight: 10, //minimum height
                        minWidth: 70,
                      ),
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black, width: 2),
                      // ),
                      // padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.lightBlue),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            DateFormat('dd MMMM yyyy').format(tx.date),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
