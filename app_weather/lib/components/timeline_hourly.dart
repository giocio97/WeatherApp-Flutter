import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineHourly extends StatefulWidget {
  @override
  State<TimelineHourly> createState() => _TimelineHourlyState();
}

class _TimelineHourlyState extends State<TimelineHourly> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              
                (context, index) => TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.center,
                      startChild: Padding(
                        padding: const EdgeInsets.only(right:2.0),
                        child: Center(child: Text("11:30pm")),
                      ),
                      endChild: Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: Center(child: Text("22°")),
                      ),
                      beforeLineStyle: LineStyle(color: Colors.white),
                      indicatorStyle: IndicatorStyle(
                        color: Colors.white,
                        
                      ),
                    ),
                childCount: 10),
          ),
        ],
      ),
    );
  }
}
