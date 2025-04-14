import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/widgets/body.dart';
import 'package:bs_flutter_project_task/core/widgets/ppm.dart';
import 'package:bs_flutter_project_task/core/widgets/text.dart';
import 'package:bs_flutter_project_task/presentation/details/bloc/details_bloc.dart';
import 'package:bs_flutter_project_task/presentation/details/widgets/chart.dart';
import 'package:bs_flutter_project_task/presentation/details/widgets/plants.dart';
import 'package:bs_flutter_project_task/presentation/details/widgets/room_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DetailsBloc>();

    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        final paddingTop = MediaQuery.of(context).padding.top;
        return Body(
          isFullScreen: true,
          child: Container(
            color: bSiteBg,
            padding: EdgeInsets.fromLTRB(25, paddingTop + 25, 25, 0),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.only(right: 15),
                        child: SvgPicture.asset("assets/images/back_arrow.svg"),
                      ),
                    ),

                    Image.asset("assets/images/home.png", width: 24),
                    SizedBox(width: 10),
                    TextB(
                      text: "Home",
                      fontSize: 22,
                      fontColor: bBlack,
                      fontWeight: FontWeight.w300,
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0XFF42D58B),
                            Color(0XFF65D49C),
                            Color(0XFF2DF28F),
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextB(
                        text: "Good",
                        fontSize: 12,
                        fontColor: bWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Ppm(ppmValue: 652),
                            Image.asset(
                              "assets/images/status_bar.png",
                              width: 100,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "History",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16,
                                color: Color(0XFF838383),
                              ),
                            ),

                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                      color: bGray,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        CustomLineChart(),

                        SizedBox(height: 20),
                        RoomSection(),
                        SizedBox(height: 20),
                        Plants(),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
