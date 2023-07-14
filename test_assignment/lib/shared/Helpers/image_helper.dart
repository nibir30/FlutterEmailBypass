import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageHelper {
  static AssetImage getImageAsset(String name) {
    return AssetImage('lib/assets/images/$name');
  }

  static Widget getImageWidget(String fileName) {
    return Image(
      image: ImageHelper.getImageAsset(fileName),
    );
  }

  static Widget getSvg(String iconName, {double? height = 20, double? width = 20, Color? color}) {
    return color != null
        ? SvgPicture.asset(
            "lib/assets/svg/$iconName.svg",
            height: height,
            width: width,
            color: color,
            allowDrawingOutsideViewBox: true,
          )
        : SvgPicture.asset(
            "lib/assets/svg/$iconName.svg",
            height: height,
            width: width,
            allowDrawingOutsideViewBox: false,
            // allowDrawingOutsideViewBox: true,
          );
  }

  static Widget getSvgWithDarkMode(BuildContext context, String lightIconName, String darkIconName, {double? height = 20, double? width = 20}) {
    return Theme.of(context).brightness == Brightness.light
        ? SvgPicture.asset(
            "lib/assets/svg/$lightIconName.svg",
            height: height,
            width: width,
            allowDrawingOutsideViewBox: true,
          )
        : SvgPicture.asset(
            "lib/assets/svg/$darkIconName.svg",
            height: height,
            width: width,
            allowDrawingOutsideViewBox: true,
          );
  }
}
