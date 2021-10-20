import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ProjectX/constants.dart';
import 'package:ProjectX/ui_widgets/buttons.dart';
import 'package:ProjectX/ui_widgets/project_text.dart';
import 'package:ProjectX/ui_widgets/ui_utils.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorWhite,
        title: _AppBarTitle(),
        iconTheme: IconThemeData(color: kColorBlack),
        actions: [
          _SearchIcon(
            onTap: () => UiUtils.goto(kRouteOnboarding),
          )
        ],
      ),
      drawer: _ProjectXDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _LoginInfo(),
            ProjectButton(
              onTap: () => UiUtils.goto(kRouteOnboarding),
              text: 'View all restaurants',
              borderRadius: kBorderRadius,
            ).paddingTop(kSpacingMedium)
          ],
        ),
      ),
    );
  }
}

class _LoginInfo extends StatelessWidget {
  const _LoginInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
      ),
      child: ClipRRect(
        borderRadius: kBorderRadius,
        child: Column(
          children: [
            _LoginInfoContent().paddingBottom(kSpacingMedium),
            ProjectButton(
              onTap: () => UiUtils.goto(kRouteOnboarding),
              text: 'Log in',
              withBg: true,
            )
          ],
        ),
      ),
    );
  }
}

class _LoginInfoContent extends StatelessWidget {
  const _LoginInfoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorPrimary.withOpacity(0.1),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: kColorPrimary, borderRadius: kFullBorderRadius),
            child: Icon(
              EvaIcons.personOutline,
              color: kColorWhite,
            ),
          ).paddingRight(kSpacingSmall),
          Expanded(
              child: ProjectText(
                  'Log in or create an account to receive rewards and offers.'))
        ],
      ).paddingAll(kSpacingMedium),
    );
  }
}

class _DrawerItem {
  final String text;
  final String? routeName;
  final IconData icon;

  _DrawerItem({required this.text, this.routeName, required this.icon});
}

class _ProjectXDrawer extends StatelessWidget {
  final List<_DrawerItem> _items = [
    _DrawerItem(
        icon: EvaIcons.homeOutline, text: 'Home', routeName: kRouteOnboarding),
    _DrawerItem(
      icon: EvaIcons.pricetagsOutline,
      text: 'Offers',
    ),
    _DrawerItem(
        icon: Icons.notifications_outlined,
        text: 'Notifications',
        routeName: kRouteOnboarding),
    _DrawerItem(
        icon: Icons.archive_outlined,
        text: 'Your orders',
        routeName: kRouteOnboarding),
    _DrawerItem(
        icon: Icons.wallet_giftcard_outlined,
        text: 'ProjectX Pay',
        routeName: kRouteOnboarding),
    _DrawerItem(
        icon: Icons.settings_outlined,
        text: 'Settings',
        routeName: kRouteOnboarding),
    _DrawerItem(
        icon: Icons.help_center_outlined,
        text: 'Get help',
        routeName: kRouteOnboarding),
    _DrawerItem(
        icon: Icons.info_outline,
        text: 'About app',
        routeName: kRouteOnboarding),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 30,
                        );
                      },
                      itemCount: _items.length,
                      itemBuilder: (context, position) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context,
                                _items[position].routeName ?? kRouteOnboarding);
                            // _items
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(_items[position].icon, color: kColorBlack),
                              ProjectText(_items[position].text, textSize: 16)
                                  .paddingTop(kSpacingMedium),
                            ],
                          ),
                        );
                      })))
        ])));
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectTextTitle('Select your Area',
            textColor: kColorPrimary, centerText: true)
      ],
    );
  }
}

class _SearchIcon extends StatelessWidget {
  final Function() onTap;
  const _SearchIcon({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(EvaIcons.search).paddingAll(kSpacingMedium),
    );
  }
}
