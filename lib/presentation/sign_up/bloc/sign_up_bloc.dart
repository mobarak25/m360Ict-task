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

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._iFlutterNavigator) : super(SignUpInitial()) {
    on<ChangeName>(_changeName);
    on<ChangePhone>(_changePhone);
    on<ChangeEmail>(_changeEmail);
    on<ChangePassword>(_changePassword);
    on<ChangeConfirmPassword>(_changeConfirmPassword);
    on<PressToSignUp>(_pressToSignUp);
    on<ChangeVisibility>(_changeVisibility);
  }

  final IFlutterNavigator _iFlutterNavigator;

  FutureOr<void> _changeName(ChangeName event, Emitter<SignUpState> emit) {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _changePhone(ChangePhone event, Emitter<SignUpState> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  FutureOr<void> _changeEmail(ChangeEmail event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _changePassword(
    ChangePassword event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _changeConfirmPassword(
    ChangeConfirmPassword event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.password));
  }

  FutureOr<void> _pressToSignUp(
    PressToSignUp event,
    Emitter<SignUpState> emit,
  ) async {
    if (isValid(event) && !state.isLoading) {
      emit(state.copyWith(isLoading: true));
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
        if (_iFlutterNavigator.context.mounted) {
          ScaffoldMessenger.of(_iFlutterNavigator.context).showSnackBar(
            SnackBar(
              content: Text('Signup successful! Please login.'),
              backgroundColor: bPrimaryColor,
            ),
          );
        }

        _iFlutterNavigator.pushReplacementNamed(signIn);
      } catch (e) {
        if (_iFlutterNavigator.context.mounted) {
          ScaffoldMessenger.of(_iFlutterNavigator.context).showSnackBar(
            SnackBar(content: Text('Signup failed: $e'), backgroundColor: bRed),
          );
        }
      }
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }

  bool isValid(PressToSignUp event) {
    final validate = Validator.isValidated(
      items: [
        FormItem(text: state.email, focusNode: event.emailFocusNode),
        FormItem(text: state.password, focusNode: event.passwordFocusNode),
      ],
      navigator: _iFlutterNavigator,
    );

    if (!validate) return false;
    if (state.name.isEmpty ||
        state.email.isEmpty ||
        state.password.isEmpty ||
        state.confirmPassword.isEmpty) {
      return false;
    }
    return true;
  }

  FutureOr<void> _changeVisibility(
    ChangeVisibility event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(isObscureText: !state.isObscureText));
  }
}
