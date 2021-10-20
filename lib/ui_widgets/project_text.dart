import 'package:flutter/material.dart';
import 'package:grigora/constants.dart';

class ProjectText extends StatelessWidget {
  final String text;
  final double? textSize;
  final bool centerText;
  final TextAlign? textAlign;
  final Color? textColor;
  final TextOverflow? overflow;
  final double? height;
  final int? maxLines;
  final bool? isBoldFont;
  final bool? uppercase;
  final bool isLineThrough, isItalic;
  final double? letterSpacing;

  ProjectText(this.text,
      {this.textSize,
      this.textColor,
      this.maxLines,
      this.overflow,
      this.centerText = false,
      this.textAlign = TextAlign.left,
      this.isLineThrough = false,
      this.letterSpacing,
      this.isItalic = false,
      this.uppercase = false,
      this.height,
      this.isBoldFont = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      // this not clean_code but we'll name it like that
      text is String
          ? uppercase!
              ? text.toUpperCase()
              : text
          : 'no_text',
      // uppercase ? text.toUpperCase() : text,
      textAlign: centerText ? TextAlign.center : textAlign,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines ?? 100,
      style: new TextStyle(
        letterSpacing: letterSpacing ?? 0,
        color: textColor ?? kColorPrimaryText,
        fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        decoration:
            isLineThrough ? TextDecoration.lineThrough : TextDecoration.none,
        fontFamily: isBoldFont! ? kFontFamilyBold : kFontFamilyRegular,
        fontSize: textSize ?? kFontSizeNormal,
        height: height ?? 1.2,
      ),
    );
  }
}

class ProjectTextTitle extends StatelessWidget {
  final String text;
  final Color? textColor;
  final int? maxLines;
  final bool centerText;
  final TextOverflow? overflow;
  final bool isLightFont, isUpperCase;
  final double? textSize, letterSpacing;
  ProjectTextTitle(
    this.text, {
    this.textColor,
    this.textSize,
    this.maxLines,
    this.centerText = false,
    this.overflow,
    this.isLightFont = false,
    this.isUpperCase = false,
    this.letterSpacing,
  });
  @override
  Widget build(BuildContext context) {
    return ProjectText(
      text,
      uppercase: isUpperCase,
      maxLines: maxLines,
      overflow: overflow,
      centerText: centerText,
      isBoldFont: isLightFont ? false : true,
      textSize: textSize ?? kFontSizeLarge,
      letterSpacing: letterSpacing ?? 0,
      textColor: textColor ?? kColorBlack,
    );
  }
}
