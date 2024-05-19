import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sala_negra/login/login_view.dart';
import 'package:sala_negra/models/app_events.dart';
import 'package:sala_negra/models/app_posts.dart';
import 'package:sala_negra/models/event.dart';
import 'package:sala_negra/models/post.dart';
import 'package:sala_negra/models/session.dart';
import 'package:sala_negra/utilities/api_routes.dart';
import 'package:sala_negra/utilities/sala_negra_toast.dart';

class ApiOperations {

  static final ApiOperations _instance = ApiOperations._internal();

  late final Dio _dioHttp;
  BuildContext? context;

  ApiOperations._internal() {
    _dioHttp = Dio();
    _dioHttp.options.baseUrl = ApiRoutes.baseUrl;
    _dioHttp.options.contentType = Headers.formUrlEncodedContentType;
  }

  static ApiOperations getInstance() {
    return _instance;
  }

  void setContext(BuildContext context){
    this.context = context;
  }

  Future<bool> loginSuccess(String email, String password) async {
    final data = FormData.fromMap({
      'email': email,
      'password': password,
    });
    final Response response = await _dioHttp.post(ApiRoutes.login, data: data, options: Options(validateStatus: (status)=>true));
    if(response.statusCode == 200){
      Map<String, dynamic> data = response.data['data'];
      Session.getInstance().updateSession(token: data['token'], id: data['id']);
      getUserEvents(data['id'],Session.getInstance().token);
      return true;
    }
    return false;
  }

  void getUserEvents(String id, String? token) async {
    final data = FormData.fromMap({
      'id': id
    });
    final Response response = await _dioHttp.post(
      ApiRoutes.getUserEvents, 
      data: data, 
      options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        },
        validateStatus: (status)=>true)
    );
    if(response.statusCode == 401){
      sessionExpired(context);
    }
    if(response.statusCode == 200){
      List<Event> eventData = (response.data['data'] as List<dynamic>).map((item) => Event.fromJson(item)).toList();      
      Session.getInstance().loadUserEvents(userEvents: eventData);
    }
  }

  Future<String> registerSuccess(String email, String name, String lastname, String password) async {
    final data = FormData.fromMap({
      'email': email,
      'firstName': name,
      'lastName': lastname,
      'password': password,
    });
    final Response response = await _dioHttp.post(ApiRoutes.register, data: data, options: Options(validateStatus: (status)=>true));
    if(response.statusCode == 200){
      return 'usuario registrado';
    } else if(response.statusCode == 409){
      return 'este usuario ya existe';
    }
    return 'error al procesar la solicitud';
  }

  Future<bool> getEvents(String? token) async{
    final Response response = await _dioHttp.get(ApiRoutes.getEvents,
     options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        },
      validateStatus: (status)=>true)
    );
    if(response.statusCode == 401){
      sessionExpired(context);
    }
    if(response.statusCode == 200){
      List<Event> eventData = (response.data['data'] as List<dynamic>).map((event) => Event.fromJson(event)).toList();      
      AppEvents.getInstance().setEvents(eventData);
      return true;
    }
    return false;
  }

  Future<bool> getPosts(String? token) async{
    final Response response = await _dioHttp.get(ApiRoutes.getPosts,
     options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        },
      validateStatus: (status)=>true)
    );
    if(response.statusCode == 401){
      sessionExpired(context);
    }
    if(response.statusCode == 200){
      List<Post> postData = (response.data['data'] as List<dynamic>).map((post) => Post.fromJson(post)).toList();
      AppPosts.getInstance().setAppPosts(postData);
      return true;
    }
    return false;
  }

  Future<String> changePassword(String? id, String? password, String? newPassword, String? token) async {
    final data = FormData.fromMap({
      'id': id,
      'password': password,
      'newPassword': newPassword
    });
    final Response response = await _dioHttp.post(
      ApiRoutes.changePassword, data: data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        validateStatus: (status)=>true
      )
    );
    if(response.statusCode == 401){
      sessionExpired(context);
    }
    if(response.statusCode == 200){
      return 'Contraseña cambiada con éxito';
    } else if(response.statusCode == 404){
      return 'Contraseña incorrecta';
    }
    return 'Error al procesar la solicitud';
  }

  Future<bool> removeAccount(String? id, String? token) async {
    final data = FormData.fromMap({
      'id':id
    });
    final Response response = await _dioHttp.delete(
      ApiRoutes.removeUser,
      data: data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        validateStatus: (status) => true,
      )
    );
    if(response.statusCode == 401){
      sessionExpired(context);
    }
    if(response.statusCode == 200){
      return true;
    }
    return false;
  }

  Future<bool> likeEvent(String? id, String? eventId, String? token) async {
    final data = FormData.fromMap({
      'id':id,
      'eventId':eventId
    });
    final Response response = await _dioHttp.post(
      ApiRoutes.like, data: data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        validateStatus: (status) => true,
      )
    );
    if(response.statusCode == 401){
      sessionExpired(context);
    }
    if(response.statusCode == 200){
      return true;
    }
    return false;
  }

  Future<bool> dislikeEvent(String? id, String? eventId, String? token) async {
    final data = FormData.fromMap({
      'id':id,
      'eventId':eventId
    });
    final Response response = await _dioHttp.post(
      ApiRoutes.dislike, data: data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        validateStatus: (status) => true,
      )
    );
    if(response.statusCode == 401){
      sessionExpired(context);
    }
    if(response.statusCode == 200){
      return true;
    }
    return false;
  }

  void sessionExpired(BuildContext? context){
    Session.getInstance().closeSession();
    Navigator.push(
      context!,
      MaterialPageRoute(builder: (context) => const LoginView()),
    );
    SalaNegraToast.launchToast('La sesión ha expirado');
  }
}
