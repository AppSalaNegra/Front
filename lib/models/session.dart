import 'package:sala_negra/models/event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  String? token;
  String? id;
  List<Event> userEvents = [];

  static final Session _instance = Session._internal();

  Session._internal();

  static Session getInstance() {
    return _instance;
  }
  
  void updateSession({required String token, required String id}) {
    this.token = token;
    this.id = id;
  }

  void loadUserEvents({required List<Event> userEvents}) {
    this.userEvents = userEvents;
  }

  void closeSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');
    await prefs.remove('token');
    await prefs.setBool('isLoggedIn', false);
    token = null;
    id = null;
    userEvents = [];
  }

  void addUserEvent(Event event){
    userEvents.add(event);
  }

  void removeUserEvent(Event event){
    userEvents.remove(event);
  }
}