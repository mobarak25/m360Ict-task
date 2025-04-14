import 'package:bs_flutter_project_task/core/router/route_constents.dart';
import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/widgets/body.dart';
import 'package:bs_flutter_project_task/core/widgets/text.dart';
import 'package:bs_flutter_project_task/presentation/home/bloc/home_bloc.dart';
import 'package:bs_flutter_project_task/presentation/home/widgets/home_card.dart';
import 'package:bs_flutter_project_task/presentation/home/widgets/user_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Body(
          isFullScreen: true,
          child: Stack(
            children: [
              Container(
                color: bSiteBg,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserSection(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 35),
                            TextB(
                              text: "My Places",
                              fontSize: 16,
                              fontColor: bDark,
                              fontWeight: FontWeight.w300,
                            ),
                            SizedBox(height: 10),
                            HomeCard(
                              title: "Home",
                              tag: "Good",
                              ppmValue: 652,
                              viewDetails: () {
                                Navigator.of(context).pushNamed(details);
                              },
                            ),
                            SizedBox(height: 25),
                            HomeCard(
                              title: "Office",
                              tag: "Healthy",
                              ppmValue: 447,
                              viewDetails: () {
                                Navigator.of(context).pushNamed(details);
                              },
                            ),
                            SizedBox(height: 25),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 10,
                right: 10,
                left: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        bloc.add(LogOut());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextB(text: "Log Out", fontColor: bRed),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(details);
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: bPrimaryColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(Icons.add, color: bWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
