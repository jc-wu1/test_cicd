import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? currentBackPressTime;

  void _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Material Dialog'),
          content: const Text('Hey! I am Dialog Box!'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  _dismissDialog();
                },
                child: const Text('Close')),
            TextButton(
              onPressed: () {
                _dismissDialog();
              },
              child: const Text('HelloWorld!'),
            )
          ],
        );
      },
    );
  }

  void _dismissDialog() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          currentBackPressTime = now;
          // Fluttertoast.showToast(msg: exit_warning);
          debugPrint('double back');
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.blue, // Navigation bar
            statusBarColor: Colors.purpleAccent, // Status bar
          ),
          title: const Text('Home'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: const Text('asdsad'),
              onPressed: () {
                _showMaterialDialog();
              },
            ),
            const ElevatedButton(
              child: Text('next navigation'),
              // onPressed: () {
              //   Navigator.pushNamed(context, RoutesName.newPage);
              // },
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
