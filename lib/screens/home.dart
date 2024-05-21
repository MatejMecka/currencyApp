import 'package:flutter/material.dart';
import 'package:myapp/models/currency.dart';
import 'package:myapp/widgets/exchange_rate.dart';
import 'package:myapp/widgets/loadingFailed.dart';
import 'package:myapp/widgets/select_currency.dart';
import 'package:myapp/widgets/text_boxes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currencyMain = "EUR";
  String currencyToConvert = "EUR";
  double exchangeValue = 1.0;
  Data? exchangeRates;
  bool failedToLoad = false;
  double valueInput = 0.0;

  void markAsFailed () {
    setState(() {
      failedToLoad = true;
    });
  }

  void changeCurrency(String value, bool main, Currency exchange) {
    setState(() {
      if (main) {
        currencyMain = value;
      } else {
        currencyToConvert = value;
      }

      final data = exchange.data;
      if (data != null) {
        exchangeValue = data.getCurrencyValue(data, currencyToConvert) ?? 0.0;
        exchangeRates = data;
      } else if (exchangeRates != null) {
        exchangeValue = exchangeRates!.getCurrencyValue(exchangeRates!, currencyToConvert) ?? 0.0;
      }
    });
  }

  void changeValue(double valueForm) {
    setState(() {
      valueInput = valueForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Builder(
        builder: (context) {
          if(failedToLoad){
            return loadingFailed();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SelectCurrency(isMain: true, updateVals: changeCurrency, markAsFailed: markAsFailed, initialValue: currencyMain),
              textBox(value: valueInput, changeValue: changeValue),
              ExchangeRate(currency1: currencyMain, currency2: currencyToConvert, exchange: exchangeValue),
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        String temp = currencyToConvert;
                        currencyToConvert = currencyMain;
                        currencyMain = temp;
                      });

                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(24),
                      backgroundColor: Colors.purple[400]
                    ),
                    child: const Icon(Icons.swap_vert, color: Colors.black,),
                  )
                ],
              ),
              SelectCurrency(isMain: false, updateVals: changeCurrency, markAsFailed: markAsFailed, initialValue: currencyToConvert),
              textBox(value: valueInput * exchangeValue, changeValue: (value) {}),
            ],
          );
        }
      )
    );
  }
}
