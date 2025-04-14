import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/theme/typography.dart';
import 'package:bs_flutter_project_task/core/utils/enums.dart';
import 'package:bs_flutter_project_task/core/widgets/app_login_icons.dart';
import 'package:bs_flutter_project_task/core/widgets/body.dart';
import 'package:bs_flutter_project_task/core/widgets/button.dart';
import 'package:bs_flutter_project_task/core/widgets/check_box.dart';
import 'package:bs_flutter_project_task/core/widgets/have_an_account.dart';
import 'package:bs_flutter_project_task/core/widgets/powered_by.dart';
import 'package:bs_flutter_project_task/core/widgets/text.dart';
import 'package:bs_flutter_project_task/core/widgets/text_field.dart';
import 'package:bs_flutter_project_task/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        final bloc = context.read<SignInBloc>();
        return Body(
          child: Container(
            color: bWhite,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 35),
                        TextB(
                          text: "Sign In",
                          fontColor: bBlack,
                          textStyle: bHead1M,
                        ),
                        TextB(
                          text: "Let's save environment together",
                          fontSize: 14,
                          fontColor: bBlack,
                        ),

                        SizedBox(height: size.height * 0.08),
                        TextFieldB(
                          fieldTitle: "Email",
                          paddingHeight: 2,
                          focusNode: emailFocusNode,
                          onChanged: (String email) {
                            bloc.add(ChangeEmail(email: email));
                          },
                          hintText: "user@example.com",
                          controller: emailController,

                          errorText:
                              state.forms == Forms.invalid &&
                                      state.email.isEmpty
                                  ? 'Please Enter Your Email'
                                  : '',
                        ),
                        SizedBox(height: 10),
                        TextFieldB(
                          fieldTitle: "Password",
                          obscureText: true,
                          paddingHeight: 2,
                          focusNode: passwordFocusNode,
                          onChanged: (String password) {
                            bloc.add(ChangePassword(password: password));
                          },
                          hintText: "**********",
                          controller: passwordController,
                          suffixIcon: SvgPicture.asset(
                            "assets/images/password.svg",
                            colorFilter: const ColorFilter.mode(
                              bLightGray,
                              BlendMode.srcIn,
                            ),
                          ),

                          errorText:
                              state.forms == Forms.invalid &&
                                      state.password.isEmpty
                                  ? 'Please Enter Your password'
                                  : '',
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CheckboxB(
                              label: "Remember me",
                              press: () {},
                              defaultValue: false,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: TextB(
                                text: "Forgotten Password",
                                fontSize: 13,
                                fontColor: bPrimaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        ButtonB(
                          heigh: 42,
                          text: "Sign In",
                          loading: state.isLoading,
                          press: () {
                            bloc.add(
                              PressToSignIn(
                                emailFocusNode: emailFocusNode,
                                passwordFocusNode: passwordFocusNode,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Or Sign In with",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12,
                                color: bGray,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        AppLoginIcons(),
                        SizedBox(height: size.height * 0.09),
                        HaveAnAccount(isLoginScreen: true),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                PoweredBy(),
              ],
            ),
          ),
        );
      },
    );
  }
}
