import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _people = 0;
  String _infoText = "You can come in!";

  void _refreshState(int i) {
    setState(() {
      _people += i;  

      if(_people < 0) {
        _infoText = "Upside down?";
      } else if (_people >= 0 && _people <= 12) {
        _infoText = "You can come in!";
      } else if (_people > 12){
        _infoText = "Full house! :)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text(
          "People Counter",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
          children: [
            Image.asset(
              "assets/restaurant.jpg",
              fit: BoxFit.cover,
              height: 1000.0,
            ),
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "People: $_people", 
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold,
                  fontSize: 70.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      "+1", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0
                      ),
                    ),
                    onPressed: () => {
                      _refreshState(1)
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "-1", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0
                      ),
                    ),
                    onPressed: () => {
                      _refreshState(-1)
                    },
                  ),
                ],
              ),
              Text(
                _infoText, 
                style: TextStyle(
                  color: Colors.white, 
                  fontStyle: FontStyle.italic, 
                  fontSize: 50.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

