import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';
import 'package:mental_health_application/utilities/line_chart_titles.dart';

class MoodGraphPage extends StatefulWidget {
  @override
  _MoodGraphPageState createState() => _MoodGraphPageState();
}

class _MoodGraphPageState extends State<MoodGraphPage> {
  final List<Color> gradientColors = [
    orangeColor,
    orangeColor,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your mood statistics'),
        backgroundColor: mainAppColor,
      ),
      body: Center(
        child: LineChart(
          LineChartData(
            minX: 0,
            maxX: 12,
            minY: 0,
            maxY: 6,
            titlesData: LineTitles.getTitleData(),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: mainAppColor,
                  strokeWidth: 2,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Colors.black,
                  strokeWidth: 2,
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: mainAppColor,
                width: 2,
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 0.5),
                  FlSpot(2, 3),
                  FlSpot(3, 4.7),
                  FlSpot(6, 3.6),
                  FlSpot(12, 5.3),
                ],
                isCurved: true,
                dotData: FlDotData(show: false),
                colors: gradientColors,
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
