import 'package:flutter/material.dart';

class loadingFailed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Icon(Icons.error, size: 64.0,),
        Text("Failed to load!", style: TextStyle(
          fontSize: 32.0
        ))
      ],)
    );
  }
}
