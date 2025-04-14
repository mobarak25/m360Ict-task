import 'package:bs_flutter_project_task/core/widgets/body.dart';
import 'package:bs_flutter_project_task/core/widgets/powered_by.dart';
import 'package:bs_flutter_project_task/presentation/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return Body(
          isFullScreen: true,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: 214,
                    height: 214,
                    child: Image.asset("assets/images/app_icon.png"),
                  ),
                ),
              ),
              PoweredBy(),
            ],
          ),
        );
      },
    );
  }
}
