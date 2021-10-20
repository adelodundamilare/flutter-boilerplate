import 'package:flutter/material.dart';
import 'package:ProjectX/constants.dart';

class SimpleLayout extends StatelessWidget {
  final Widget body;
  final bool isLoading;
  const SimpleLayout({Key? key, required this.body, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: kColorBlack),
          backgroundColor: kColorWhite,
          elevation: 0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(child: body),
            Positioned.fill(
                child: Visibility(
              visible: isLoading,
              child: Container(
                  color: kColorWhite.withOpacity(0.8),
                  width: kWidthFull(context),
                  child: Center(child: CircularProgressIndicator())),
            ))
          ],
        ),
      ),
    );
  }
}
