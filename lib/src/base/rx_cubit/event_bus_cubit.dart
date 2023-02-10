import 'dart:async';

import 'package:event_bus/event_bus.dart';

import '../../service_locator.dart';

class EventBusCubit {
  final List<StreamSubscription> subscriptions = [];
  final EventBus eventBus = locator<EventBus>();
}