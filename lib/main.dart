import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ProjectX/constants.dart';
import 'package:ProjectX/ui_widgets/app_pages.dart';
import 'package:ProjectX/ui_widgets/ui_utils.dart';
import 'package:ProjectX/utils/locator.dart';
import 'package:ProjectX/views/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  // setupLogger();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: kAppName,
        theme: kThemeData,
        // darkTheme: kThemeDataDark,
        debugShowCheckedModeBanner: false,
        navigatorKey: UiUtils.navigatorKey(),
        home: HomeScreen(),
        onGenerateRoute: (RouteSettings settings) =>
            AppPages.generateRoute(settings));
  }
}
