import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ProjectX/constants.dart';
import 'package:ProjectX/ui_widgets/project_text.dart';
import 'package:ProjectX/utils/base_widget.dart';
import 'package:ProjectX/utils/log_printer.dart';
import 'package:nb_utils/nb_utils.dart';

class UiUtils {
  static showSnackbar(String message) => GetBar(
        message: message,
        margin: const EdgeInsets.all(8),
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        borderRadius: 8,
        isDismissible: true,
        animationDuration: Duration(milliseconds: 500),
        duration: Duration(seconds: 2),
      )..show();

  static showNotification(
          {String title = 'no_title', String message = 'no_message'}) =>
      Get.snackbar(title, message);

  static showDialog(
          {required Widget widget, Color? bgColor, required String title}) =>
      Get.dialog(AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: bgColor,
        scrollable: true,
        content: Builder(builder: (context) {
          return Container(
              width: kWidthFull(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      ProjectTextTitle(
                        title,
                        centerText: true,
                        textSize: kFontSizeBig,
                      ).expand(),
                      Icon(
                        EvaIcons.close,
                        color: kColorBlack.withOpacity(0.3),
                      ).onTap(() => UiUtils.goBack())
                    ],
                  ),
                  widget.paddingTop(kSpacingMedium),
                ],
              ));
        }).paddingAll(kSpacingMedium),
      ));

  static Widget projectSVG(String image, {Color? color, double? width}) =>
      SvgPicture.asset(
        image,
        color: color,
        width: width,
      );

  static showSimpleDialog(
          {required String title, message, required Function()? onOkPressed}) =>
      Get.dialog(AlertDialog(
        titlePadding:
            EdgeInsets.only(top: kSpacingMedium, left: kSpacingMedium),
        backgroundColor: kColorWhite,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        title: ProjectTextTitle(
          title,
          textSize: kFontSizeMedium,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ProjectText(
              message,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ProjectText(
                  "Ok",
                  textColor: kColorPrimary,
                ).onTap(onOkPressed)
              ],
            ).paddingTop(kSpacingMedium)
          ],
        ),
        buttonPadding: EdgeInsets.zero,
      ));

  static showBottomSheetModal(
          {required BuildContext context, required Widget widget}) =>
      showModalBottomSheet(
          context: context,
          backgroundColor: kColorWhite,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(kSpacingSmall))),
          builder: (BuildContext context) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  widget,
                ],
              ),
            );
          });

  static showBottomSheet({required Widget body}) =>
      Get.bottomSheet<BaseWidget>(body,
          backgroundColor: kColorWhite,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(kSpacingSmall))));

  static goto(String pageRoute, {dynamic arguments}) {
    getLogger("ui_utils.dart").w('goto: route:$pageRoute arguments:$arguments');
    return Get.toNamed(pageRoute, arguments: arguments);
  }

  static gotoDisableBack(String pageRoute, {dynamic arguments}) {
    getLogger("ui_utils.dart").w('goto: route:$pageRoute arguments:$arguments');
    return Get.offAllNamed(pageRoute, arguments: arguments);
  }

  static gotoDisableThisBack(String pageRoute, {dynamic arguments}) {
    getLogger("ui_utils.dart").w('goto: route:$pageRoute arguments:$arguments');
    return Get.offNamed(pageRoute, arguments: arguments);
  }

  static goToWidget(Widget widget) {
    getLogger("ui_utils.dart").w('goToWidget: widget:$widget');
    return Get.to(() => widget);
  }

  static goBack() => Get.back();

  static navigatorKey() => Get.key;

  static DecorationImage lucaNetworkImageProvider(String? image) =>
      DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(image ?? kImagesFingerPrint));

  static Widget lucaNetworkImageWithContainer(String? networkImage,
          {double? width, double? height}) =>
      CachedNetworkImage(
        imageUrl: networkImage ?? kImagesFingerPrint,
        imageBuilder: (context, imageProvider) => Container(
          width: width ?? MediaQuery.of(context).size.width,
          height: height ?? MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );

  static List<Widget> lucaDynamicWidget(
      {required List<dynamic> items,
      required Widget Function(int position) builder}) {
    return items
        .asMap()
        .map((int position, _) => MapEntry(position, builder(position)))
        .values
        .toList();
  }
}
