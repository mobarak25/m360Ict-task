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
import 'package:bs_flutter_project_task/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameFocusNode = FocusNode();
    final phoneFocusNode = FocusNode();
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
    final passwordConfirmFocusNode = FocusNode();

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordConfirmController = TextEditingController();

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        final bloc = context.read<SignUpBloc>();
        return Body(
          child: Container(
            color: bWhite,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35),
                  TextB(text: "Sign Up", fontColor: bBlack, textStyle: bHead1M),
                  TextB(
                    text: "Let's save environment together",
                    fontSize: 14,
                    fontColor: bBlack,
                  ),

                  SizedBox(height: size.height * 0.08),
                  TextFieldB(
                    fieldTitle: "Name",
                    paddingHeight: 2,
                    focusNode: nameFocusNode,
                    onChanged: (String name) {
                      bloc.add(ChangeName(name: name));
                    },
                    hintText: "e.g: Ahmed Ariyan",
                    controller: nameController,
                    errorText:
                        state.forms == Forms.invalid && state.name.isEmpty
                            ? 'Please Enter Your name'
                            : '',
                  ),
                  SizedBox(height: 10),

                  Text(
                    "Phone Number",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  IntlPhoneField(
                    style: TextStyle(fontSize: 14),
                    dropdownTextStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0XFF9F9F9F),
                    ),
                    decoration: InputDecoration(
                      hintText: '17XXXXXXXX',
                      hintStyle: TextStyle(
                        color: Color(0XFFD6D6D6),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      isDense: true, // reduces default vertical padding
                      contentPadding: EdgeInsets.only(
                        top: 14,
                      ), // adjust this as needed
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bPrimaryColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bGray),
                      ),
                      counterText: '',
                    ),
                    initialCountryCode: 'BD',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                      bloc.add(ChangePhone(phone: phone.completeNumber));
                    },
                  ),
                  SizedBox(height: 10),
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
                        state.forms == Forms.invalid && state.email.isEmpty
                            ? 'Please Enter Your Email'
                            : '',
                  ),
                  SizedBox(height: 10),
                  TextFieldB(
                    fieldTitle: "Password",
                    obscureText: state.isObscureText,
                    paddingHeight: 2,
                    focusNode: passwordFocusNode,
                    onChanged: (String password) {
                      bloc.add(ChangePassword(password: password));
                    },
                    hintText: "**********",
                    controller: passwordController,
                    suffixIcon: InkWell(
                      onTap: () {
                        bloc.add(ChangeVisibility());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SvgPicture.asset(
                          "assets/images/password.svg",
                          colorFilter: ColorFilter.mode(
                            state.isObscureText ? bLightGray : bPrimaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    errorText:
                        state.forms == Forms.invalid && state.password.isEmpty
                            ? 'Please Enter Your Username'
                            : '',
                  ),
                  SizedBox(height: 10),
                  TextFieldB(
                    fieldTitle: "Confirm Password",
                    obscureText: true,
                    paddingHeight: 2,
                    focusNode: passwordConfirmFocusNode,
                    onChanged: (String password) {
                      bloc.add(ChangeConfirmPassword(password: password));
                    },
                    hintText: "**********",
                    controller: passwordConfirmController,
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: SvgPicture.asset(
                          "assets/images/password.svg",
                          colorFilter: ColorFilter.mode(
                            state.isObscureText ? bLightGray : bPrimaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),

                    errorText:
                        state.forms == Forms.invalid &&
                                state.confirmPassword.isEmpty
                            ? 'Please Enter Confirm Password'
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
                    loading: state.isLoading,
                    heigh: 42,
                    text: "Sign Up",
                    press: () {
                      bloc.add(
                        PressToSignUp(
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
                  SizedBox(height: 25),
                  HaveAnAccount(isLoginScreen: false),
                  SizedBox(height: 35),
                  PoweredBy(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
