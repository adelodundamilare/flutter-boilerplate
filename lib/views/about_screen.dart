import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ProjectX/constants.dart';
import 'package:ProjectX/ui_widgets/project_text.dart';
import 'package:nb_utils/nb_utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kColorBlack),
        backgroundColor: kColorWhite,
        centerTitle: true,
        elevation: 0,
        title: ProjectTextTitle('About app'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _AboutItem(
              text: 'FAQ',
              onTap: () => print('tapping this one'),
            ),
            _AboutItem(
              text: 'Privacy policy',
              onTap: () => print('tapping this one'),
            ).paddingTop(kSpacingMedium),
            _AboutItem(
              text: 'Terms of use',
              onTap: () => print('tapping this one'),
            ),
            _AboutItem(
              text: 'Facebook',
              onTap: () => print('tapping this one'),
            ).paddingTop(kSpacingMedium),
            _AboutItem(
              text: 'Twitter',
              onTap: () => print('tapping this one'),
            ),
            _AboutItem(
              text: 'Instagram',
              onTap: () => print('tapping this one'),
            ),
          ],
        ).paddingAll(kSpacingMedium),
      ),
    );
  }
}

class _AboutItem extends StatelessWidget {
  final bool hideLine;
  final String text;
  final Function() onTap;
  const _AboutItem(
      {Key? key,
      this.hideLine = false,
      required this.text,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: ProjectText(text)),
              Icon(
                EvaIcons.chevronRight,
                color: kColorGrey,
              )
            ],
          ),
          Visibility(
            visible: !hideLine,
            child: Container(
              color: kColorGrey,
              height: 1,
            ),
          ).paddingTop(kSpacingMedium)
        ],
      ),
    );
  }
}
