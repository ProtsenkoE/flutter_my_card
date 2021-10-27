import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_card/src/config/color_constants.dart';
import 'package:flutter_my_card/src/config/image_constants.dart';
import 'package:flutter_my_card/src/config/string_constants.dart'
as string_constant;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgroundColor(),
            const TopBackground(),
            const Logo(),
            const MainCard(),
            const AdditionalInformation(),
          ],
        ),
      ),
    );
  }

  Container _backgroundColor() {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.moreLightBlueColor,
      ),
    );
  }
}

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80.0,
      child: Column(
        children: [
          _phoneInfo(),
          const SizedBox(
            height: 30.0,
          ),
          _emailInfo(),
        ],
      ),
    );
  }

  Container _emailInfo() {
    return Container(
      width: 312.0,
      decoration: BoxDecoration(
        color: ColorConstants.lightPinkColor,
        border: Border.all(
          color: ColorConstants.pinkColor,
          width: 2.0,
        ),
      ),
      child: ListTile(
        minLeadingWidth: 10.0,
        horizontalTitleGap: 10.0,
        leading: Image(
          image: Svg(
            '${AllImages().image}/user_ico_svg.svg',
            size: const Size(24.0, 24.0),
          ),
        ),
        title: Text(
          string_constant.email,
          style: TextStyle(
            color: ColorConstants.redColor,
            fontFamily: 'Roboto',
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  Container _phoneInfo() {
    return Container(
      width: 312.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstants.greenColor,
          width: 2.0,
        ),
        color: ColorConstants.lightGreenColor,
      ),
      child: ListTile(
        minLeadingWidth: 10.0,
        horizontalTitleGap: 10.0,
        leading: Image(
          image: Svg(
            '${AllImages().image}/phone_ico.svg',
            size: const Size(24.0, 24.0),
          ),
        ),
        title: Text(
          string_constant.phoneNumber,
          style: TextStyle(
            color: ColorConstants.secondGreenColor,
            fontFamily: 'Roboto',
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

class MainCard extends StatefulWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  bool _loadImageError = false;
  final ImageProvider _userImage = AssetImage('${AllImages().image}/user.png');

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200.0,
      child: SizedBox(
        width: 219.0,
        height: 219.0,
        child: FlipCard(
          fill: Fill.fillBack,
          direction: FlipDirection.HORIZONTAL,
          front: _avatar(),
          back: _qrCode(),
        ),
      ),
    );
  }

  Container _qrCode() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: QrImage(
        padding: const EdgeInsets.all(15.0),
        data: string_constant.linkedinLink,
        version: QrVersions.auto,
      ),
    );
  }

  Container _avatar() {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.lightBlueColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: Center(
        child: CircleAvatar(
            radius: 90.0,
            backgroundImage: _loadImageError ? null : _userImage,
            backgroundColor: Colors.transparent,
            onBackgroundImageError: _loadImageError
                ? null
                : (_, __) {
              setState(() {
                _loadImageError = true;
              });
            },
            child: _loadImageError
                ? const Text(
              string_constant.errorLoadingImage,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: 'Roboto',
              ),
            )
                : null),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 31.0,
      top: 0,
      child: Text(
        string_constant.appName,
        style: TextStyle(
          color: ColorConstants.moreDarkBlueColor,
          fontSize: 36.0,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

class TopBackground extends StatelessWidget {
  const TopBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage('${AllImages().image}/bg_top.png'),
      ),
    );
  }
}
