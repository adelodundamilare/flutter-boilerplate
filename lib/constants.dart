import 'package:flutter/material.dart';

const String kThemeLocal = 'THEME_DATA';
const String kAppName = 'Luca';
const String kUserReq = 'user_req';
const String kUserData = 'user_data';
const String kOrderItems = 'order_items';
const String kProducts = 'products';

const double kSpacingSmall = 10;
const double kSpacingMedium = 20;
const double kSpacingLarge = 40;
const double kSpacingExtraLarge = 150;

// Border
const double kBorderWidth = 1;
const double kThickBorderWidth = 3;
const BorderRadius kBorderRadius =
    BorderRadius.all(const Radius.circular(kSpacingSmall));
const BorderRadius kBorderRadiusSmall =
    BorderRadius.all(const Radius.circular(5));
const BorderRadius kBorderLargeRadius =
    BorderRadius.all(const Radius.circular(kSpacingLarge));
const BorderRadius kFullBorderRadius =
    BorderRadius.all(const Radius.circular(100));
final BoxDecoration kTextFieldBoxDecoration = BoxDecoration(
    borderRadius: kBorderRadius,
    border: Border.all(color: kThemeData.dividerColor),
    color: Colors.white);
final BoxDecoration kButtonBoxDecoration = BoxDecoration(
    borderRadius: kFullBorderRadius, border: Border.all(color: kColorPrimary));
final BoxDecoration kBottomSheetBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: new BorderRadius.only(
    topLeft: const Radius.circular(25.0),
    topRight: const Radius.circular(25.0),
  ),
);

// Box Shadow
BoxShadow kBoxShadow(Color color) => BoxShadow(
      color: color,
      spreadRadius: 0,
      blurRadius: 15,
      offset: Offset(0, 2), // changes position of shadow
    );

// Colors
const Color kColorPrimary = Color(0xFFCA3114);
const Color kColorPrimaryLight = Color(0xFFF7D6D6);
const Color kColorPurple = Color(0xFFA5A6F6);
const Color kColorGold = Color(0xFFFD9942);
const Color kColorPrimaryText = Colors.black;
final Color kColorWhite = Colors.white;
const Color kSecondaryTextColor = Colors.white;
const Color kScaffoldBackgroundColor = Colors.white;
final Color kSubtextColor = Colors.grey[400]!;
final Color kColorBlack = Colors.black;
final Color kColorGrey = Color(0x24999999);
final Color kColorGreyLight = Colors.grey[100]!;
final Color kColorGreen = Color(0xFF3CC13B);
final Color kColorDarkGrey = Color(0xFF707070);
final Color kColorFacebook = Color(0xFF4267B2);
final Color kColorGoogle = Color(0xFF4285F4);

// FontSize
const double kFontSizeSmall = 12;
const double kFontSizeNormal = 14;
const double kFontSizeMedium = 16;
const double kFontSizeBig = 20;
const double kFontSizeLarge = 32;

// fonts
const String kFontFamilyLight = 'AvertaStd-Light';
const String kFontFamilyBold = 'AvertaStd-Light';
const String kFontFamilyRegular = 'CircularStdMedium';

// Text
final TextStyle kHeadline1TextStyle = TextStyle(
  color: kColorPrimaryText,
  fontFamily: kFontFamilyRegular,
  fontSize: kFontSizeLarge,
  height: 1.2,
);
final TextStyle kHeadline2TextStyle = TextStyle(
    fontSize: 25, fontWeight: FontWeight.normal, color: kColorPrimaryText);
final TextStyle kHeadline3TextStyle = TextStyle(
    fontSize: 21, fontWeight: FontWeight.bold, color: kColorPrimaryText);
final TextStyle kBodyText1Style =
    TextStyle(fontSize: 16, color: kColorPrimaryText);
final TextStyle kBodyText2Style =
    TextStyle(fontSize: 14, color: kColorPrimaryText);
final TextStyle kBodyText3Style = TextStyle(
    fontSize: 18, fontWeight: FontWeight.bold, color: kColorPrimaryText);
final TextStyle kSubtitle1Style = TextStyle(fontSize: 12, color: kSubtextColor);
final TextStyle kSubtitle2Style =
    TextStyle(fontSize: 12, color: kColorPrimaryText);

// Theme
final ThemeData kThemeData = ThemeData.light().copyWith(
    primaryColor: kColorPrimary,
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    dividerColor: Colors.grey[350]!,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: IconThemeData(size: 24),
    textTheme: TextTheme(
        headline1: kHeadline1TextStyle,
        headline2: kHeadline2TextStyle,
        headline3: kHeadline3TextStyle,
        bodyText1: kBodyText1Style,
        bodyText2: kBodyText2Style,
        subtitle1: kSubtitle1Style,
        subtitle2: kSubtitle2Style));

final ThemeData kThemeDataDark = ThemeData.dark().copyWith(
    primaryColor: kColorPrimary,
    primaryColorDark: Colors.black,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: Colors.grey[900],
    dividerColor: Colors.grey[350]!,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: IconThemeData(size: 24),
    textTheme: TextTheme(
        headline1: kHeadline1TextStyle.copyWith(color: Colors.white),
        headline2: kHeadline2TextStyle.copyWith(color: Colors.white),
        headline3: kHeadline3TextStyle.copyWith(color: Colors.white),
        bodyText1: kBodyText1Style.copyWith(color: Colors.white),
        bodyText2: kBodyText2Style.copyWith(color: Colors.white),
        subtitle1: kSubtitle1Style.copyWith(color: Colors.white),
        subtitle2: kSubtitle2Style.copyWith(color: Colors.white)));

// Routes
const kRouteOnboarding = "/onboarding";

// Images
const String kImagesFingerPrint = 'images/icon-fingerprint.png';

// width
double kWidthFull(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double kHeightFull(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// Endpoint
const _base_url = 'https://luca-auth.herokuapp.com';
const kEndpointRegister = _base_url + '/user/signup';
