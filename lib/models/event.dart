class Event {
  String id;
  DateTime startDateTime;
  DateTime finishDateTime;
  String title;
  String excerpt;
  String url;
  String slug;
  String thumbnailUrl;
  Map<String, String> cats;
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
      '_id': {'\$oid': id},
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

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id']['\$oid'],
      startDateTime: DateTime.fromMillisecondsSinceEpoch(int.parse(json['startDateTime']['\$date']['\$numberLong'])),
      finishDateTime: DateTime.fromMillisecondsSinceEpoch(int.parse(json['finishDateTime']['\$date']['\$numberLong'])),
      title: json['title'],
      excerpt: json['excerpt'],
      url: json['url'],
      slug: json['slug'],
      thumbnailUrl: json['thumbnail_url'],
      cats: Map<String, String>.from(json['cats']),
      status: json['status'],
      hierarchy: json['hierarchy'],
      type: json['type'],
    );
  }
}
