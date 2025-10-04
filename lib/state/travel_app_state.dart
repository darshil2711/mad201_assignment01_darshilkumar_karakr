// MAD201-01 Assignment 1
// Student: Darshilkumar Karkar
// Student ID: A00203357
// Description: InheritedNotifier wrapper to access TravelAppModel.

import 'package:flutter/widgets.dart';
import 'travel_app_model.dart';

class TravelAppState extends InheritedNotifier<TravelAppModel> {
  const TravelAppState({
    Key? key,
    required TravelAppModel notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static TravelAppModel of(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<TravelAppState>();
    assert(widget != null, 'TravelAppState not found in context');
    return widget!.notifier!;
  }
}