import 'package:flutter/material.dart';

class ContinentDataScreen extends StatefulWidget {
  ContinentDataScreen({Key? key}) : super(key: key);

  @override
  _ContinentDataScreenState createState() => _ContinentDataScreenState();
}

class _ContinentDataScreenState extends State<ContinentDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('continent'),
    );
  }
}