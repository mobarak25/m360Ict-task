part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.isLoading = false,
    this.forms = Forms.initial,
    this.name = '',
    this.phone = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isObscureText = true,
  });

  final bool isLoading;
  final Forms forms;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isObscureText;

  SignUpState copyWith({
    bool? isLoading,
    Forms? forms,
    String? name,
    String? phone,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isObscureText,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      forms: forms ?? this.forms,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isObscureText: isObscureText ?? this.isObscureText,
    );
  }

  @override
  List<Object> get props => [
    isLoading,
    forms,
    name,
    phone,
    email,
    password,
    confirmPassword,
    isObscureText,
  ];
}

final class SignUpInitial extends SignUpState {}
