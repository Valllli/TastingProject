import 'package:flutter/cupertino.dart';

class TodoItem {
  final bool checked;
  final String text;

  TodoItem({@required this.checked, @required this.text});

  TodoItem.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        checked = json['checked'] == 1;

  Map<String, dynamic> toJson() => {
        'checked': checked ? 1 : 0,
        'text': text,
      };
}
