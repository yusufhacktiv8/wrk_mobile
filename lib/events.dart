import 'package:event_bus/event_bus.dart';
import 'package:dashboard/models/ChartData.dart';

EventBus eventBus = new EventBus();

class MonthYearChangedEvent {
  DateTime monthYear;
  MonthYearChangedEvent(this.monthYear);
}

class LineChartChangedEvent {
  ChartData data;
  LineChartChangedEvent(this.data);
}