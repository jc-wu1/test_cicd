import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
import 'package:test_cicd/src/cubit/theme/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.blue,
          statusBarColor: Colors.pinkAccent,
        ),
        title: const Text('New Page'),
      ),
      body: const Text('hello, this is new page'),
      floatingActionButton: FloatingActionButton(
        heroTag: 'fabNewPage3',
        child: const Icon(Icons.brightness_6),
        onPressed: () => context.read<ThemeCubit>().toggleTheme(),
      ),
    );
  }
}
