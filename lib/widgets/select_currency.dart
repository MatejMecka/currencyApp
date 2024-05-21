import 'package:flutter/material.dart';
import 'package:myapp/models/currency.dart';
import 'package:myapp/requests/exchange.dart';

class SelectCurrency extends StatefulWidget {
  const SelectCurrency({
    super.key,
    required this.updateVals,
    required this.isMain,
    required this.markAsFailed,
    required this.initialValue,
  });

  final bool isMain;
  final Function(String value, bool main, Currency exchange) updateVals;
  final Function() markAsFailed;
  final String initialValue;

  @override
  State<SelectCurrency> createState() => _SelectCurrencyState();
}

class _SelectCurrencyState extends State<SelectCurrency> {
  static const List<String> list = <String>[
    'EUR', 'USD', 'JPY', 'BGN', 'CZK', 'DKK', 'GBP', 'HUF', 'PLN', 'RON',
    'SEK', 'CHF', 'ISK', 'NOK', 'HRK', 'RUB', 'TRY', 'AUD', 'BRL', 'CAD', 
    'CNY', 'HKD', 'IDR', 'ILS', 'INR', 'KRW', 'MXN', 'MYR', 'NZD', 'PHP', 
    'SGD', 'THB', 'ZAR'
  ];
  String dropdownValue = list.first;
  bool isLoading = true;
  Currency? data;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialValue;
    fetchData(true);
  }

  Future<bool> fetchData(bool calledFromInit) async {
    if (!widget.isMain) {
      return false;
    }
    if (!calledFromInit) {
      const snackbar = SnackBar(content: Text("Fetching data..."));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    setState(() {
      isLoading = true;
    });
    try {
      final newData = await fetchExchange(dropdownValue);
      setState(() {
        data = newData;
        isLoading = false;
      });

      if (!calledFromInit) {
        const snackbar2 = SnackBar(content: Text("Found exchange rates!"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar2);
      }

      return true;
    } catch (error) {
      if (!calledFromInit) {
        final snackbar3 = SnackBar(content: Text("Error fetching data... $error"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar3);
      }
      setState(() {
        isLoading = false;
      });
      widget.markAsFailed();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isMain) {
      if(isLoading){
        return CircularProgressIndicator();
      } else {
        return buildDropdownButton();
      }
    } else {
      return buildDropdownButton();
    }
  }

  Widget buildDropdownButton() {
    return Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.currency_exchange),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) async {
          setState(() {
            dropdownValue = value!;
          });
          if (widget.isMain) {
            bool success = await fetchData(false);
            if (success) {
              widget.updateVals(dropdownValue, widget.isMain, data ?? Currency());
            }
          } else {
            widget.updateVals(dropdownValue, widget.isMain, data ?? Currency());
          }
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
