class ApiRoutes{
  static String baseUrl = 'http://10.0.2.2:8080';

  static String getEvents = '/events/get';
  static String getEventsByCat = '/events/getByCat';

  static String getPosts = '/posts';

  static String login = '/session/login';
  static String register = '/session/register';

  static String removeUser = '/users/remove';
  static String changePassword = '/users/changePassword';
  static String dislike = '/users/dislike';
  static String like = '/users/like';
  static String getUserEvents = '/users/getLikedEvents';
}