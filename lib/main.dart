import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'login_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SecondPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Nav demo"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () => {Navigator.of(context).push(_createRoute())},
                child: Text("Click Me!"))
          ],
        ),
      ),
    );
  }
}

class CustomLoginPage extends StatelessWidget {
  const CustomLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      home: LoginScreen(),
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.orange,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.orange),
        // fontFamily: 'SourceSansPro',
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: Colors.orange,
          ),
          button: TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          headline1: TextStyle(fontFamily: 'Quicksand'),
          headline2: TextStyle(fontFamily: 'Quicksand'),
          headline4: TextStyle(fontFamily: 'Quicksand'),
          headline5: TextStyle(fontFamily: 'NotoSans'),
          headline6: TextStyle(fontFamily: 'NotoSans'),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
          subtitle2: TextStyle(fontFamily: 'NotoSans'),
          overline: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   Map<String, bool> _texts = {
//     "InduceSmile.com": false,
//     "google.com": false,
//     "youtube.com": false,
//     "yahoo.com": false,
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       body: Column(
//         children: _texts.keys
//             .map((text) => Theme(
//                   data: ThemeData(
//                       checkboxTheme: CheckboxThemeData(
//                     visualDensity: VisualDensity.standard,
//                   )),
//                   child: CheckboxListTile(
//                     controlAffinity: ListTileControlAffinity.leading,
//                     title: Transform.translate(
//                       offset: Offset(-5, 0),
//                       child: Text(
//                         text,
//                         style: TextStyle(fontSize: 28),
//                       ),
//                     ),
//                     value: _texts[text],
//                     onChanged: (val) {
//                       setState(() {
//                         _texts[text] = val!;
//                       });
//                     },
//                   ),
//                 ))
//             .toList(),
//       ),
//     ));
//   }
// }
