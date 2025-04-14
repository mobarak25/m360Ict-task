import 'dart:async';

import 'package:bs_flutter_project_task/core/form_validator/validator.dart';
import 'package:bs_flutter_project_task/core/navigator/iflutter_navigator.dart';
import 'package:bs_flutter_project_task/core/router/route_constents.dart';
import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this._iFlutterNavigator) : super(SignInInitial()) {
    on<PressToSignIn>(_pressToSignIn);
    on<ChangeEmail>(_changeEmail);
    on<ChangePassword>(_changePassword);
  }

  final IFlutterNavigator _iFlutterNavigator;

  FutureOr<void> _changeEmail(ChangeEmail event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _changePassword(
    ChangePassword event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _pressToSignIn(
    PressToSignIn event,
    Emitter<SignInState> emit,
  ) async {
    if (isValid(event) && !state.isLoading) {
      emit(state.copyWith(isLoading: true));
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );

        _iFlutterNavigator.pushReplacementNamed(home);
      } catch (e) {
        if (_iFlutterNavigator.context.mounted) {
          ScaffoldMessenger.of(_iFlutterNavigator.context).showSnackBar(
            SnackBar(
              content: Text('Login failed: Invalid email / password'),
              backgroundColor: bRed,
            ),
          );
        }
      }
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }

  bool isValid(PressToSignIn event) {
    final validate = Validator.isValidated(
      items: [
        FormItem(text: state.email, focusNode: event.emailFocusNode),
        FormItem(text: state.password, focusNode: event.passwordFocusNode),
      ],
      navigator: _iFlutterNavigator,
    );

    if (!validate) return false;
    if (state.email.isEmpty || state.password.isEmpty) {
      return false;
    }
    return true;
  }
}
