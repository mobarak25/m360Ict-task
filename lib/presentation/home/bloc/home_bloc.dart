import 'dart:async';

import 'package:bs_flutter_project_task/core/navigator/iflutter_navigator.dart';
import 'package:bs_flutter_project_task/core/router/route_constents.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._iFlutterNavigator) : super(HomeInitial()) {
    on<LogOut>(_logOut);
  }

  final IFlutterNavigator _iFlutterNavigator;

  FutureOr<void> _logOut(LogOut event, Emitter<HomeState> emit) async {
    await FirebaseAuth.instance.signOut();
    _iFlutterNavigator.pushReplacementNamed(signIn);
  }
}
