part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  const SignInState({
    this.isLoading = false,
    this.forms = Forms.initial,
    this.email = '',
    this.password = '',
  });

  final bool isLoading;
  final Forms forms;
  final String email;
  final String password;

  SignInState copyWith({
    bool? isLoading,
    Forms? forms,
    String? email,
    String? password,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      forms: forms ?? this.forms,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [isLoading, forms, email, password];
}

final class SignInInitial extends SignInState {}
