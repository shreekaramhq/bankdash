import 'package:flutter/material.dart';

class BankDash extends StatelessWidget {
  const BankDash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BankDash'),
        ),
        body: const Center(
          child: Text('Welcome to BankDash'),
        ),
      ),
    );
  }
}
