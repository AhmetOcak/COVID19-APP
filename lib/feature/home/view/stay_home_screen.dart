import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StayHomeScreen extends StatelessWidget {
  const StayHomeScreen({Key? key}) : super(key: key);

  final String text = 'STAY HOME';
  final url = "assets/images/Drcorona.svg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(url),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: MyText(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Text MyText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }
}
