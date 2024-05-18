import 'package:sala_negra/models/event.dart';

class Session {
  String? token;
  String? id;
  List<Event>? userEvents;

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

  void closeSession(){
    token = null;
    id = null;
    userEvents = null;
  }

  void addUserEvent(Event event){
    userEvents!.add(event);
  }

  void removeUserEvent(Event event){
    userEvents!.remove(event);
  }
}