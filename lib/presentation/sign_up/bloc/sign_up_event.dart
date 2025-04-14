part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class ChangeName extends SignUpEvent {
  const ChangeName({required this.name});
  final String name;
}

class ChangePhone extends SignUpEvent {
  const ChangePhone({required this.phone});
  final String phone;
}

class ChangeEmail extends SignUpEvent {
  const ChangeEmail({required this.email});
  final String email;
}

class ChangePassword extends SignUpEvent {
  const ChangePassword({required this.password});
  final String password;
}

class ChangeConfirmPassword extends SignUpEvent {
  const ChangeConfirmPassword({required this.password});
  final String password;
}

class ChangeVisibility extends SignUpEvent {}

class PressToSignUp extends SignUpEvent {
  const PressToSignUp({
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
}
