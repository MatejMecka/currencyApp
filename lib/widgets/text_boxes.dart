import 'package:flutter/material.dart';

class textBox extends StatefulWidget {
  const textBox({super.key, required this.value, required this.changeValue});

  final double value;
  final Function(double) changeValue;

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<textBox> {
  late TextEditingController txt;

  @override
  void initState() {
    super.initState();
    txt = TextEditingController(text: widget.value.toString());
  }

  @override
  void didUpdateWidget(covariant textBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      txt.text = widget.value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: txt,
        onChanged: (text) {
          widget.changeValue(double.tryParse(text) ?? 0.0);
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Value',
        ),
      ),
    );
  }
}
