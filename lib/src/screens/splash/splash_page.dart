import 'package:flutter/cupertino.dart';
import 'package:flutter_my_card/src/config/image_constants.dart';
import 'package:flutter_my_card/src/config/color_constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_my_card/src/config/string_constants.dart'
as string_constant;

class Splash extends StatelessWidget {
  const Splash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.lightBlueColor,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('${AllImages().image}/user_logo.png'),
            ),
            const SizedBox(
              height: 100.0,
            ),
            Text(
              string_constant.loadingText,
              style: TextStyle(
                color: ColorConstants.darkBlueColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            SpinKitFadingGrid(
              size: 50.0,
              color: ColorConstants.darkBlueColor,
            ),
          ],
        ),
      ],
    );
  }
}
