import 'package:flutter/material.dart';
import 'package:ProjectX/constants.dart';
import 'package:ProjectX/ui_widgets/buttons.dart';
import 'package:ProjectX/ui_widgets/project_text.dart';
import 'package:ProjectX/ui_widgets/ui_utils.dart';
import 'package:nb_utils/nb_utils.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      kImagesFingerPrint,
                    ),
                    fit: BoxFit.cover)),
          ),
          Positioned(bottom: 0, child: _OverlayBody())
        ],
      ),
    );
  }
}

class _OverlayBody extends StatelessWidget {
  const _OverlayBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kWidthFull(context),
      decoration: BoxDecoration(
          color: kColorWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      child: Column(
        children: [
          ProjectTextTitle(
            'ProjectX works best when we know where to deliver.',
            centerText: true,
          ),
          ProjectText(
            'If you have your location, we can do a better job to find what you want and deiver it.',
            centerText: true,
          ).paddingTop(kSpacingMedium),
          ProjectButton(
            onTap: () => UiUtils.goto(kRouteOnboarding),
            text: 'Continue',
            borderRadius: BorderRadius.circular(10),
          ).paddingTop(kSpacingMedium)
        ],
      ).paddingAll(kSpacingMedium),
    );
  }
}
