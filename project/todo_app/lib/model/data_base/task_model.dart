class Task {
  int? _id;
  String? _title;
  String? _body;

  Task(dynamic obj) {
    // _id = obj['id'];
    _title = obj['title'];
    _body = obj['body'];
  }

  Task.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _title = data['title'];
    _body = data['body'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'body': _body,
      };

  int get id => _id!;
  String get title => _title!;
  String get body => _body!;
}
