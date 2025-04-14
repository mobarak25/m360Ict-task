part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class ChangeEmail extends SignInEvent {
  const ChangeEmail({required this.email});
  final String email;
}

class ChangePassword extends SignInEvent {
  const ChangePassword({required this.password});
  final String password;
}

class PressToSignIn extends SignInEvent {
  const PressToSignIn({
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
}
