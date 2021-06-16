import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloper extends StatefulWidget {
  AboutDeveloper({Key key}) : super(key: key);
  @override
  _AboutDevState createState() => _AboutDevState();
}

class _AboutDevState extends State<AboutDeveloper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Developer'),
      ),
      body: ListView(
        children: [
          Image.asset('assets/images/forest.png'),
          Text(
            'Какой-то текст',
            textAlign: TextAlign.center,
          ),
          SignInButton(
            Buttons.GitHub,
            onPressed: () {
              launch('https://github.com/Valllli');
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Go Back'),
          )
        ],
      ),
    );
  }
}
