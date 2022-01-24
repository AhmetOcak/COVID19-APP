import 'package:flutter/material.dart';

class TotalCard extends StatelessWidget {
  TotalCard({this.data = "", this.text = ""});

  String data;
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Card(
        elevation: 0,
        color: Colors.white60,
        child: Center(
          child: Text(
            "$text: $data",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
