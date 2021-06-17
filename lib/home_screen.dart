import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practic/about_developer.dart';

import 'package:practic/todo_item.dart';
import 'package:practic/todo_list_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TodoItem> items = <TodoItem>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ПРАКТИКА'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Меню',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('About Developer'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutDeveloper()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return TodoListItem(
                name: item.text,
                isChecked: item.checked,
                onChanged: (bool value) {
                  setState(() {
                    final newItem = TodoItem(checked: value, text: item.text);
                    items[index] = newItem;
                  });
                });
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              String result;
              //int index;
              return AlertDialog(
                title: Text('Введите текст'),
                content: TextField(
                  onChanged: (text) {
                    result = text;
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        final item = TodoItem(text: result, checked: false);
                        Navigator.of(context).pop('Ok');
                        items.add(item);
                      });
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
