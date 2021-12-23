import 'package:covid19_app/constants/curved_navbar_items.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StayHomeScreen extends StatelessWidget {
  StayHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String text = 'STAY HOME';
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/Drcorona.svg'),
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
