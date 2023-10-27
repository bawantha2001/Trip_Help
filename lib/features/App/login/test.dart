import 'package:flutter/material.dart';

void main() {
  runApp(CardList());
}

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RealTimeCards(),
    );
  }
}

class RealTimeCards extends StatefulWidget {
  @override
  _RealTimeCardsState createState() => _RealTimeCardsState();
}

class _RealTimeCardsState extends State<RealTimeCards> {
  List<String> cards = ['Card 1', 'Card 2']; // Initial data


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

