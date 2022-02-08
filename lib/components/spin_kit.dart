import 'package:covid19_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinKit extends StatelessWidget {
  const SpinKit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        child: SpinKitDualRing(
          color: spinKitColor,
          size: 100,
        ),
      );
  }
}