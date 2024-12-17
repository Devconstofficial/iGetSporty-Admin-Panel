import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iget_sporty_admin_panel/models/revenue_location_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RevenueChart extends StatelessWidget {
  final List<RevenueLocation> data;

  const RevenueChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: 120.w,
      child: SfCircularChart(
        margin: EdgeInsets.zero,
        legend: const Legend(
          isVisible: false,
        ),
        series: <CircularSeries>[
          DoughnutSeries<RevenueLocation, String>(
            dataSource: data,
            xValueMapper: (RevenueLocation data, _) => data.location,
            yValueMapper: (RevenueLocation data, _) => data.percentage,
            pointColorMapper: (RevenueLocation data, _) => data.colorHex,
            innerRadius: '70%',
            dataLabelSettings: const DataLabelSettings(
              isVisible: false,
            ),
          ),
        ],
      ),
    );
  }
}
