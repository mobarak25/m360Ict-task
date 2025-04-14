import 'package:bs_flutter_project_task/core/dependencies/dependencies_inject.dart';
import 'package:bs_flutter_project_task/core/navigator/iflutter_navigator.dart';
import 'package:bs_flutter_project_task/core/router/route_constents.dart';
import 'package:bs_flutter_project_task/presentation/details/bloc/details_bloc.dart';
import 'package:bs_flutter_project_task/presentation/details/view/details_screen.dart';
import 'package:bs_flutter_project_task/presentation/home/bloc/home_bloc.dart';
import 'package:bs_flutter_project_task/presentation/home/view/home_screen.dart';
import 'package:bs_flutter_project_task/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:bs_flutter_project_task/presentation/sign_in/view/sign_in_screen.dart';
import 'package:bs_flutter_project_task/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:bs_flutter_project_task/presentation/sign_up/view/sign_up_screen.dart';
import 'package:bs_flutter_project_task/presentation/splash/bloc/splash_bloc.dart';
import 'package:bs_flutter_project_task/presentation/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    print(settings.name.toString());
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => SplashBloc(getIt<IFlutterNavigator>()),
                child: const SplashScreen(),
              ),
        );

      case signIn:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => SignInBloc(getIt<IFlutterNavigator>()),
                child: const SignInScreen(),
              ),
        );
      case signUp:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => SignUpBloc(getIt<IFlutterNavigator>()),
                child: const SignUpScreen(),
              ),
        );

      case home:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => HomeBloc(getIt<IFlutterNavigator>()),
                child: const HomeScreen(),
              ),
        );
      case details:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => DetailsBloc(),
                child: const DetailsScreen(),
              ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Text("Page Not Found")),
        );
    }
  }
}
