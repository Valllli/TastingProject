import 'package:flutter/material.dart';

class TodoListItem extends StatefulWidget {
  final String name;
  TodoListItem({Key? key, required this.name}) : super(key: key);
  @override
  _TodoListItemState createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          checkColor: Colors.red,
          activeColor: Colors.white,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        Text(widget.name),
      ],
    );
  }
}
