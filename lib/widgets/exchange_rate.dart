import 'package:flutter/material.dart';

class ExchangeRate extends StatelessWidget {
  const ExchangeRate({super.key, 
    required this.currency1, 
    required this.currency2, 
    required this.exchange
  });

  final String currency1;
  final String currency2;
  final double exchange;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
        Text('1 $currency1 = $exchange $currency2', 
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
