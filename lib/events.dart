import 'package:event_bus/event_bus.dart';
import 'package:dashboard/models/ChartData.dart';

EventBus eventBus = new EventBus();

class MonthYearChangedEvent {
  DateTime dateTime;
  MonthYearChangedEvent(this.dateTime);
}

class YearChangedEvent {
  DateTime dateTime;
  YearChangedEvent(this.dateTime);
}

class LineChartChangedEvent {
  ChartData data;
  LineChartChangedEvent(this.data);
}