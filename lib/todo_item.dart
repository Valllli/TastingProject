import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:practic/todo_list_item.dart';

class TodoItem {
  final bool checked;
  final String text;

  TodoItem({required this.checked, required this.text});
  TodoItem.fromJson(Map<bool, String> json)
      : checked = json[true],
        text = json['text'];

  Map<bool, String> toJson() => {
        'checked': checked,
        'Text': text,
      };
}
