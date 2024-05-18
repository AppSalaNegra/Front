import 'package:sala_negra/models/event.dart';

class AppEvents {

  static final AppEvents _instance = AppEvents._internal();

  AppEvents._internal() : _events = [];

  static AppEvents getInstance() {
    return _instance;
  }

  final List<Event> _events;

  void addEvent(Event event) {
    _events.add(event);
  }

  void removeEventById(String id) {
    _events.removeWhere((event) => event.id == id);
  }

  Event? getEventById(String id) {
    return _events.firstWhere((event) => event.id == id);
  }

  List<Event> getAllEvents() {
    return _events;
  }

  void setEvents(List<Event> events) {
    _events.clear();
    _events.addAll(events);
  }
}