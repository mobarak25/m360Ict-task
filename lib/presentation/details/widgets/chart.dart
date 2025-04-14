import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomLineChart extends StatelessWidget {
  const CustomLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: false,
            verticalInterval: 1,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.green.withOpacity(0.2),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  TextStyle style = TextStyle(
                    color: bGray,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  );
                  switch (value.toInt()) {
                    case 0:
                      return Text(
                        'Oct\n24',
                        style: style,
                        textAlign: TextAlign.center,
                      );
                    case 1:
                      return Text(
                        'Nov\n24',
                        style: style,
                        textAlign: TextAlign.center,
                      );
                    case 2:
                      return Text(
                        'Dec\n24',
                        style: style,
                        textAlign: TextAlign.center,
                      );
                    case 3:
                      return Text(
                        'Jan\n25',
                        style: style,
                        textAlign: TextAlign.center,
                      );
                    case 4:
                      return Text(
                        'Feb\n25',
                        style: style,
                        textAlign: TextAlign.center,
                      );
                    case 5:
                      return Text(
                        'Mar\n25',
                        style: style,
                        textAlign: TextAlign.center,
                      );
                    case 6:
                      return Text(
                        'Apr\n25',
                        style: style,
                        textAlign: TextAlign.center,
                      );
                    default:
                      return Text('');
                  }
                },
                reservedSize: 35,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.green.withOpacity(0.2), width: 1),
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 10,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 5),
                FlSpot(1, 6),
                FlSpot(2, 7),
                FlSpot(3, 6.5),
                FlSpot(4, 7.5),
                FlSpot(5, 3),
                FlSpot(6, 2),
              ],
              isCurved: true,
              color: bPrimaryColor,
              barWidth: 2,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: bWhite,
                    strokeColor: bPrimaryColor,
                    strokeWidth: 2,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
