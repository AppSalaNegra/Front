class Post {
  String id;
  DateTime dateTime;
  String title;
  String excerpt;
  String url;
  String slug;
  String thumbnailUrl;
  List<Map<String, dynamic>> cats;
  String status;

  Post({
    required this.id,
    required this.dateTime,
    required this.title,
    required this.excerpt,
    required this.url,
    required this.slug,
    required this.thumbnailUrl,
    required this.cats,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': {'\$oid': id},
      'dateTime': {'\$date': {'\$numberLong': dateTime.millisecondsSinceEpoch.toString()}},
      'title': title,
      'excerpt': excerpt,
      'url': url,
      'slug': slug,
      'thumbnail_url': thumbnailUrl,
      'cats': cats,
      'status': status,
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      dateTime: DateTime.parse(json['dateTime']),
      title: json['title'],
      excerpt: json['excerpt'],
      url: json['url'],
      slug: json['slug'],
      thumbnailUrl: json['thumbnail_url'],
      cats: List<Map<String, dynamic>>.from(json['cats']),
      status: json['status'],
    );
  }
}