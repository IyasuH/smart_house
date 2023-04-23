// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// import '../models/weeklyData.dart';

class SplineAreaData {
  final double hour;
  final double watt;
  SplineAreaData({required this.hour, required this.watt});
}

List<SplineAreaData> powerData = [
  SplineAreaData(hour: 1, watt: 2),
  SplineAreaData(hour: 2, watt: 1.9),
  SplineAreaData(hour: 3, watt: 2.5),
  SplineAreaData(hour: 4, watt: 3),
  SplineAreaData(hour: 5, watt: 3.8),
  SplineAreaData(hour: 6, watt: 3.6)
];

// ignore: must_be_immutable
class SplineAreaChart extends StatefulWidget {
  String chartName;
  Color primaryColor;
  Color secondaryColor;
  List<SplineAreaData> chartData = powerData;
  SplineAreaChart({
    super.key,
    required this.chartName,
    required this.primaryColor,
    required this.secondaryColor,
    // this.chartData=powerData,
  });

  @override
  State<SplineAreaChart> createState() => _SplineAreaChartState();
}

class _SplineAreaChartState extends State<SplineAreaChart> {
  @override
  Widget build(BuildContext context) {
    return _buildSplineAreaChart();
  }

  SfCartesianChart _buildSplineAreaChart() {
    return SfCartesianChart(
      // title: ChartTitle(text: 'Weekly Sales'),
      plotAreaBorderWidth: 0,
      series: _getSalesSplieAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
      primaryXAxis: NumericAxis(
        isVisible: false,
      ),
      primaryYAxis: NumericAxis(
        isVisible: false,
      ),
    );
  }

  // List<SplineAreaData>? chartData;

  // @override
  // void initState() {
  //   chartData = salesData;
  //   super.initState();
  // }

  List<ChartSeries<SplineAreaData, double>> _getSalesSplieAreaSeries() {
    return <ChartSeries<SplineAreaData, double>>[
      SplineAreaSeries<SplineAreaData, double>(
          borderWidth: 2,
          name: widget.chartName,
          dataSource: widget.chartData,
          color: widget.secondaryColor,
          borderColor: widget.primaryColor,
          xValueMapper: (SplineAreaData sales, _) => sales.hour,
          yValueMapper: (SplineAreaData sales, _) => sales.watt)
    ];
  }

  // @override
  // void dispose() {
  //   chartData!.clear();
  //   super.dispose();
  // }
}

// class _SplineAreaData {
//   _SplineAreaData(this.day, this.daily);
//   final double day;
//   final double daily;
// }
