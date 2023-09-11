
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineHourly extends StatefulWidget {
  @override
  State<TimelineHourly> createState() => _TimelineHourlyState();
}

class _TimelineHourlyState extends State<TimelineHourly> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.center,
                    endChild: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("22°"),
                    ),
                    beforeLineStyle: LineStyle(color: Colors.white),
                    
                    indicatorStyle: IndicatorStyle(
                      color: Colors.white,
                    ),
                  ),
              childCount: 10),
        ),
      ],
    );
  }
}