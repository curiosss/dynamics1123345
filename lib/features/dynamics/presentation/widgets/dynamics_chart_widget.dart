import 'package:dynamics/features/dynamics/models/dynamic_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DynamicsChartWidget extends StatefulWidget {
  final List<DynamicModel> dynamicsData;
  const DynamicsChartWidget({
    super.key,
    required this.dynamicsData,
  });

  @override
  State<DynamicsChartWidget> createState() => _DynamicsChartWidgetState();
}

class _DynamicsChartWidgetState extends State<DynamicsChartWidget> {
  int centerIndex = 0;
  double maxVal = 0;
  double minVal = double.maxFinite;

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() {
    for (int i = 0; i < widget.dynamicsData.length; i++) {
      if (widget.dynamicsData[i].value > maxVal) {
        maxVal = widget.dynamicsData[i].value;
      }
      if (widget.dynamicsData[i].value < minVal) {
        minVal = widget.dynamicsData[i].value;
      }
    }
    minVal = minVal - 0.5;
    if (minVal < 0) {
      minVal = 0;
    }

    centerIndex = widget.dynamicsData.length ~/ 2;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AspectRatio(
        aspectRatio: 2.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: LineChart(
            LineChartData(
              backgroundColor: const Color(0xFFEFF6E8),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  drawBelowEverything: false,
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    maxIncluded: false,
                    minIncluded: false,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          DateFormat('dd MMM yyyy', 'en').format(
                              widget.dynamicsData[value.toInt()].dateDt),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    for (int i = 0; i < widget.dynamicsData.length; i++)
                      FlSpot(i.toDouble(), widget.dynamicsData[i].value),
                  ],
                  isCurved: true,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  aboveBarData: BarAreaData(
                    show: true,
                    color: const Color(0xfff3f7f5),
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.green[50],
                    spotsLine: BarAreaSpotsLine(
                      show: true,
                      checkToShowSpotLine: (spot) => spot.x == centerIndex,
                      flLineStyle: const FlLine(
                        strokeWidth: 2,
                        color: Colors.grey,
                        dashArray: [4, 4],
                      ),
                    ),
                  ),
                  color: Colors.green[700],
                  isStrokeJoinRound: true,
                  shadow: const BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    spreadRadius: 4,
                  ),
                  dotData: FlDotData(
                    show: true,
                    checkToShowDot: (spot, barData) => spot.x == centerIndex,
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 10,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
              ],
              minY: minVal,
            ),
          ),
        ),
      ),
    );
  }
}
