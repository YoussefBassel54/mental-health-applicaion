import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_application/utilities/constants.dart';
import 'package:mental_health_application/services/remote_service.dart';
import 'package:fl_chart/fl_chart.dart';

class MoodGraphPage extends StatefulWidget {
  @override
  _MoodGraphPageState createState() => _MoodGraphPageState();
}

Future GetMoods() async {
  moods = await ApiService.instance.get('daily/mood/user/');
}

Map<String, dynamic>? moods;

class _MoodGraphPageState extends State<MoodGraphPage> {
  int _clickedIndex = -1;

  TextStyle legendTextStyle = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);

  List<PieChartSectionData> buildPieChartSections() {
    return List.generate(12, (index) {
      final bool isClicked = index == _clickedIndex;
      final double fontSize = isClicked ? 35 : 20;
      final double radius = isClicked ? 210 : 190;

      switch (index) {
        case 0:
          return PieChartSectionData(
            color: Colors.green,
            value: moods!.containsKey('Happy') ? moods!["Happy"].toDouble() : 0,
            title: moods!.containsKey('Happy')
                ? moods!["Happy"].toDouble() != 0
                    ? '${moods!["Happy"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.indigo,
            value: moods!.containsKey('Sad') ? moods!["Sad"].toDouble() : 0,
            title: moods!.containsKey('Sad')
                ? moods!["Sad"].toDouble() != 0.0
                    ? '${moods!["Sad"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.brown,
            value: moods!.containsKey('Tired') ? moods!["Tired"].toDouble() : 0,
            title: moods!.containsKey('Tired')
                ? moods!["Tired"].toDouble() != 0.0
                    ? '${moods!["Tired"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.blueGrey,
            value: moods!.containsKey('Good') ? moods!["Good"].toDouble() : 0,
            title: moods!.containsKey('Good')
                ? moods!["Good"].toDouble() != 0.0
                    ? '${moods!["Good"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 4:
          return PieChartSectionData(
            color: Colors.purple,
            value: moods!.containsKey('Stressed')
                ? moods!["Stressed"].toDouble()
                : 0,
            title: moods!.containsKey('Stressed')
                ? moods!["Stressed"].toDouble() != 0.0
                    ? '${moods!["Stressed"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 5:
          return PieChartSectionData(
            color: Colors.red,
            value: moods!.containsKey('Angry') ? moods!["Angry"].toDouble() : 0,
            title: moods!.containsKey('Angry')
                ? moods!["Angry"].toDouble() != 0.0
                    ? '${moods!["Angry"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 6:
          return PieChartSectionData(
            color: Colors.orange,
            value: moods!.containsKey('Shy') ? moods!["Shy"].toDouble() : 0,
            title: moods!.containsKey('Shy')
                ? moods!["Shy"].toDouble() != 0.0
                    ? '${moods!["Shy"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 7:
          return PieChartSectionData(
            color: Colors.black12,
            value:
                moods!.containsKey('Grumpy') ? moods!["Grumpy"].toDouble() : 0,
            title: moods!.containsKey('Grumpy')
                ? moods!["Grumpy"].toDouble() != 0.0
                    ? '${moods!["Grumpy"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 8:
          return PieChartSectionData(
            color: Colors.yellow,
            value:
                moods!.containsKey('Scared') ? moods!["Scared"].toDouble() : 0,
            title: moods!.containsKey('Scared')
                ? moods!["Scared"].toDouble() != 0.0
                    ? '${moods!["Scared"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 9:
          return PieChartSectionData(
            color: Colors.greenAccent,
            value: moods!.containsKey('Worried')
                ? moods!["Worried"].toDouble()
                : 0,
            title: moods!.containsKey('Worried')
                ? moods!["Worried"].toDouble() != 0.0
                    ? '${moods!["Worried"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 10:
          return PieChartSectionData(
            color: Colors.purpleAccent,
            value: moods!.containsKey('Hurt') ? moods!["Hurt"].toDouble() : 0,
            title: moods!.containsKey('Hurt')
                ? moods!["Hurt"].toDouble() != 0.0
                    ? '${moods!["Hurt"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 11:
          return PieChartSectionData(
            color: Colors.blue,
            value: moods!.containsKey('Okay') ? moods!["Okay"].toDouble() : 0,
            title: moods!.containsKey('Okay')
                ? moods!["Okay"].toDouble() != 0.0
                    ? '${moods!["Okay"].toDouble().toStringAsPrecision(2)}%'
                    : ''
                : '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        default:
          return PieChartSectionData(
            color: Color(0xff13d38e),
            value: 0,
            title: '',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
          ;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 0), () async {
      await GetMoods();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your mood statistics'),
        backgroundColor: mainAppColor,
      ),
      body: moods == null
          ? Center(child: Text('No data found'))
          : Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: PieChart(
                      PieChartData(
                        pieTouchData:
                            PieTouchData(touchCallback: (touchResponse) {
                          setState(() {
                            if (touchResponse.touchInput is FlLongPressEnd ||
                                touchResponse.touchInput is FlPanEnd) {
                              _clickedIndex = -1;
                            } else {
                              _clickedIndex = touchResponse.touchedSectionIndex;
                            }
                          });
                        }),
                        borderData: FlBorderData(show: true),
                        sectionsSpace: 0,
                        centerSpaceRadius: 0,
                        sections: buildPieChartSections(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 250, left: 50),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Happy',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.indigo,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Sad',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.brown,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Tired',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.purple,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Stressed',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Angry',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Shy',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.black12,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Grumpy',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Scared',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.greenAccent,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Worried',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.purpleAccent,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Hurt',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Okay',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Good',
                                  style: legendTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
