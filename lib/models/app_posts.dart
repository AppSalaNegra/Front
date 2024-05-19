import 'package:sala_negra/models/post.dart';

class AppPosts {

  static final AppPosts _instance = AppPosts._internal();

  AppPosts._internal() : _posts = [];

  static AppPosts getInstance() {
    return _instance;
  }

  final List<Post> _posts;

  void addEvent(Post post) {
    _posts.add(post);
  }

  void removeEventById(String id) {
    _posts.removeWhere((post) => post.id == id);
  }

  Post? getPostById(String id) {
    return _posts.firstWhere((post) => post.id == id);
  }

  List<Post> getAllPosts() {
    return _posts;
  }

  void setAppPosts(List<Post> posts) {
    _posts.clear();
    _posts.addAll(posts);
  }
}