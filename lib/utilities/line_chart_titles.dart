import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          margin: 8,
          reservedSize: 30,
          getTextStyles: (value) => const TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          margin: 8,
          reservedSize: 35,
          getTextStyles: (value) => const TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'worst';
              case 6:
                return 'best';
            }
            return '';
          },
        ),
      );
}
