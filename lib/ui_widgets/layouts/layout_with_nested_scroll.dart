import 'package:flutter/material.dart';
import 'package:ProjectX/constants.dart';
import 'package:ProjectX/ui_widgets/project_text.dart';

class LayoutWithNestedScroll extends StatelessWidget {
  final Widget body, backgroundWidget;
  final double? expandedHeight;
  final String? title;
  const LayoutWithNestedScroll(
      {Key? key,
      required this.body,
      this.expandedHeight,
      this.title,
      required this.backgroundWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: expandedHeight ?? 150,
              floating: false,
              title: ProjectTextTitle(title ?? ''),
              centerTitle: true,
              pinned: true,
              iconTheme: IconThemeData(color: kColorBlack),
              elevation: 0,
              backgroundColor: kColorWhite,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: ProjectTextTitle(''),
                background: backgroundWidget,
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: body,
        ),
      )),
    );
  }
}
