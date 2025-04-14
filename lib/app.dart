import 'package:bs_flutter_project_task/core/dependencies/dependencies_inject.dart';
import 'package:bs_flutter_project_task/core/navigator/iflutter_navigator.dart';
import 'package:bs_flutter_project_task/core/network_info/network_info.dart';
import 'package:bs_flutter_project_task/core/router/app_router.dart';
import 'package:bs_flutter_project_task/core/router/route_constents.dart';
import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp(this.networkInfo, {super.key});

  final NetworkInfo networkInfo;

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> with WidgetsBindingObserver {
  //This is internet connection checker (Observer)
  // For showing "No Internet Dialog" turn off phone internet :)
  //=========================================================
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    widget.networkInfo.checkInternetConnection(getIt<IFlutterNavigator>());
    super.initState();
  }

  //dispose Observer============
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: bPrimaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: bWhite,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: bPrimaryColor),
        ),
        fontFamily: 'Poppins',
      ),
      navigatorKey: getIt<IFlutterNavigator>().navigatorKey,
      initialRoute: splash,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
