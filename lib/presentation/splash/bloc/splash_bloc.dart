import 'dart:async';

import 'package:bs_flutter_project_task/core/navigator/iflutter_navigator.dart';
import 'package:bs_flutter_project_task/core/router/route_constents.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._flutterNavigator) : super(SplashInitial()) {
    on<GoHome>(_goHome);

    add(GoHome());
  }

  final IFlutterNavigator _flutterNavigator;

  FutureOr<void> _goHome(GoHome event, Emitter<SplashState> emit) async {
    await Future.delayed(Duration(seconds: 5), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        _flutterNavigator.pushReplacementNamed(home);
      } else {
        _flutterNavigator.pushReplacementNamed(signIn);
      }
    });
  }
}
