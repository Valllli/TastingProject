import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  final String name;
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  TodoListItem(
      {Key key,
      @required this.name,
      @required this.isChecked,
      @required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: isChecked,
          checkColor: Colors.blue,
          activeColor: Colors.white,
          onChanged: onChanged,
        ),
        Text(name),
      ],
    );
  }
}
