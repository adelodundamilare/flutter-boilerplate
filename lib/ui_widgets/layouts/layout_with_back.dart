import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grigora/constants.dart';
import 'package:grigora/ui_widgets/project_text.dart';
import 'package:nb_utils/nb_utils.dart';

class LayoutWithBack extends StatelessWidget {
  final Widget body;
  final String title;
  final bool withStack;
  const LayoutWithBack(
      {Key? key,
      this.withStack = false,
      required this.body,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: kColorBlack),
        title: ProjectTextTitle(title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kColorWhite,
        actions: [
          SvgPicture.asset(kImagesFingerPrint).paddingRight(kSpacingMedium),
        ],
      ),
      body: withStack
          ? body
          : SingleChildScrollView(
              child: body,
            ),
    );
  }
}
