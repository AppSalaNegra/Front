class Event {
  String id;
  DateTime startDateTime;
  DateTime finishDateTime;
  String title;
  String excerpt;
  String url;
  String slug;
  String thumbnailUrl;
  List<Map<String, String>> cats;
  String status;
  String hierarchy;
  String type;

  Event({
    required this.id,
    required this.startDateTime,
    required this.finishDateTime,
    required this.title,
    required this.excerpt,
    required this.url,
    required this.slug,
    required this.thumbnailUrl,
    required this.cats,
    required this.status,
    required this.hierarchy,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': {'\$oid': id},
      'startDateTime': {'\$date': {'\$numberLong': startDateTime.millisecondsSinceEpoch.toString()}},
      'finishDateTime': {'\$date': {'\$numberLong': finishDateTime.millisecondsSinceEpoch.toString()}},
      'title': title,
      'excerpt': excerpt,
      'url': url,
      'slug': slug,
      'thumbnail_url': thumbnailUrl,
      'cats': cats,
      'status': status,
      'hierarchy': hierarchy,
      'type': type,
    };
  }

  List<String> getCategoryNames() {
    return cats.map((cat) => cat.values.first).toList();
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      startDateTime: DateTime.parse(json['startDateTime']),
      finishDateTime: DateTime.parse(json['finishDateTime']),
      title: json['title'],
      excerpt: json['excerpt'],
      url: json['url'],
      slug: json['slug'],
      thumbnailUrl: json['thumbnail_url'],
      cats: (json['cats'] as List)
          .map((cat) => Map<String, String>.from(cat))
          .toList(),
      status: json['status'],
      hierarchy: json['hierarchy'],
      type: json['type'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Event) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;

}
