import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';
import 'package:mental_health_application/utilities/line_chart_titles.dart';

import '../services/remote_service.dart';

class RateDayGraphPage extends StatefulWidget {
  @override
  _RateDayGraphPageState createState() => _RateDayGraphPageState();
}

class _RateDayGraphPageState extends State<RateDayGraphPage> {
  final List<Color> gradientColors = [
    orangeColor,
    orangeColor,
  ];
  Future GetRates() async {
    dayRatings = await ApiService.instance.get('daily/rating/user/');
  }

  Map<String, dynamic>? dayRatings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      await GetRates();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your day ratings'),
        backgroundColor: mainAppColor,
      ),
      body: dayRatings == null
          ? Center(child: Text('No data found'))
          : Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: MediaQuery.of(context).size.height - 200,
                child: BarChart(
                  BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 50,
                      minY: 0,
                      titlesData: FlTitlesData(
                        bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (val) => const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                            margin: 0,
                            getTitles: (double value) {
                              switch (value.toInt()) {
                                case 0:
                                  return 'Great';
                                case 1:
                                  return 'Good';
                                case 2:
                                  return 'Ok';
                                case 3:
                                  return 'Poor';
                                case 4:
                                  return 'Bad';
                                default:
                                  return '';
                              }
                            }),
                      ),
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                                y: dayRatings!.containsKey('Great')
                                    ? dayRatings!["Great"].toDouble()
                                    : 0,
                                colors: [
                                  Color(0xff0293ee),
                                  Color(0xff0293ee),
                                ]),
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                                y: dayRatings!.containsKey('Good')
                                    ? dayRatings!["Good"].toDouble()
                                    : 0,
                                colors: [
                                  Color(0xfff8b250),
                                  Color(0xfff8b250),
                                ]),
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                                y: dayRatings!.containsKey('Ok')
                                    ? dayRatings!["Ok"].toDouble()
                                    : 0,
                                colors: [
                                  Color(0xff845bef),
                                  Color(0xff845bef),
                                ]),
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                                y: dayRatings!.containsKey('Poor')
                                    ? dayRatings!["Poor"].toDouble()
                                    : 0,
                                colors: [
                                  Color(0xff13d38e),
                                  Color(0xff13d38e),
                                ]),
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 4,
                          barRods: [
                            BarChartRodData(
                                y: dayRatings!.containsKey('Bad')
                                    ? dayRatings!["Bad"].toDouble()
                                    : 0,
                                colors: [
                                  Colors.red,
                                  Colors.red,
                                ]),
                          ],
                          showingTooltipIndicators: [0],
                        ),
                      ]),
                ),
              ),
            ),
    );
  }
}
