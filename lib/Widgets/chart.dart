import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widhya_club/Models/clubs_detail.dart';

import 'indicator.dart';

class Chart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Chart();
}

class _Chart extends State {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    double sum = 0;
    var map = Provider.of<ClubDetail>(context).pieChartData;
    map.forEach((key, value) {
      sum += value;
    });
    map.forEach((key, value) {
      map[key] = value / sum;
    });
    var sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
    List<String> list = map.keys.toList();
    List<double> list2 = map.values.toList();
    int len = map.length;
    // print(sortedMap);
    return Card(
      elevation: 10,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                    pieTouchData:
                        PieTouchData(touchCallback: (pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse.touchInput is FlLongPressEnd ||
                            pieTouchResponse.touchInput is FlPanEnd) {
                          touchedIndex = -1;
                        } else {
                          touchedIndex = pieTouchResponse.touchedSectionIndex;
                        }
                      });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(list2, sum, len)),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: Color(0xff0293ee),
                text: list[len - 1],
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xfff8b250),
                text: list[len - 2],
                isSquare: true,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color(0xff13d38e),
                text: 'Others',
                isSquare: true,
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      List<double> list2, double sum, int len) {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: list2.last * 100,
            title: (list2.last * 100).toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: list2[len - 2] * 100,
            title: (list2[len - 2] * 100).toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: (1 - list2[len - 1] - list2[len - 2]) * 100,
            title:
                ((1 - list2[len - 1] - list2[len - 2]) * 100).toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          return null;
      }
    });
  }
}
