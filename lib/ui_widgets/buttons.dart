import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ProjectX/constants.dart';
import 'package:ProjectX/ui_widgets/project_text.dart';
import 'package:nb_utils/nb_utils.dart';

class ProjectButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Widget? icon;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool withBg;
  final BorderRadiusGeometry? borderRadius;
  ProjectButton(
      {required this.onTap,
      this.icon,
      required this.text,
      this.width,
      this.borderRadius,
      this.padding,
      this.withBg = false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(vertical: kSpacingMedium),
        decoration: BoxDecoration(
            color: withBg ? kColorPrimary : kColorWhite,
            border: Border.all(color: kColorPrimary, width: 2),
            borderRadius: borderRadius ?? kBorderRadius),
        width: width ?? kWidthFull(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: icon ?? Container(),
            ),
            Expanded(
              child: ProjectTextTitle(
                text,
                centerText: true,
                textColor: withBg ? kColorWhite : kColorPrimary,
                textSize: kFontSizeMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectButtonExtended extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget? rightWidget;
  const ProjectButtonExtended(
      {Key? key, required this.title, required this.onTap, this.rightWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kWidthFull(context),
      padding: EdgeInsets.symmetric(
          vertical: kSpacingMedium, horizontal: kSpacingMedium),
      decoration:
          BoxDecoration(borderRadius: kBorderRadius, color: kColorPrimary),
      child: Row(
        children: [
          Expanded(
            child: ProjectTextTitle(
              title,
              textColor: kColorWhite,
            ),
          ),
          rightWidget ?? Container(),
          Icon(EvaIcons.chevronRight, color: kColorWhite),
        ],
      ),
    ).onTap(onTap);
  }
}
