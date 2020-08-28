import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 1000),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);

    _animation.addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("images/background image.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black26,
            colorBlendMode: BlendMode.darken,
          ),
          ListView(
            children: <Widget>[
              FlutterLogo(
                size: _animation.value * 150,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark,
                    primaryColor: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle:
                            TextStyle(color: Colors.teal, fontSize: 20.0)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "enter email",
                              hintText: "e.g-mhdsahil000@gmail.com",
                              hintStyle: TextStyle(color: Colors.white54)),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "password",
                            hintText: "e.g-********",
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                        ),
                        MaterialButton(
                          height: 50,
                          minWidth: 150,
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                          splashColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
