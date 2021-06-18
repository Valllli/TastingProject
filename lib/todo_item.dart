import 'package:flutter/cupertino.dart';

class TodoItem {
  final bool checked;
  final String text;
  final int id;

  TodoItem({@required this.checked, @required this.text, @required this.id});

  TodoItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        checked = json['checked'] == 1,
        text = json['text'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'checked': checked ? 1 : 0,
        'text': text,
      };
}
