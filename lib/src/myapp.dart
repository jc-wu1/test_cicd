import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cicd/src/account.dart';
import 'package:test_cicd/src/cart.dart';
import 'package:test_cicd/src/myhomepage.dart';
import 'package:test_cicd/src/profile.dart';
import 'bloc/counter/counter_bloc.dart';
import 'cubit/theme/theme_cubit.dart';
import 'constants.dart';
import 'router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: BlocProvider(
              create: (context) => CounterBloc(),
              child: const CounterPage(),
            ),
            initialRoute: RoutesName.home,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final ListQueue<int> _navigationQueue = ListQueue();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // var textTheme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: () async {
        if (index == 0) return true;
        setState(() {
          index = 0;
        });
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(title: const Text('Counter')),
        // body: Center(
        //   child: BlocBuilder<CounterBloc, int>(
        //     builder: (context, count) {
        //       return Text('$count', style: textTheme.headline1);
        //     },
        //   ),
        // ),
        body: (getBody(index)),
        // floatingActionButton: Column(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 5.0),
        //       child: FloatingActionButton(
        //         child: const Icon(Icons.add),
        //         onPressed: () => context.read<CounterBloc>().add(Increment()),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 5.0),
        //       child: FloatingActionButton(
        //         child: const Icon(Icons.remove),
        //         onPressed: () => context.read<CounterBloc>().add(Decrement()),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(vertical: 5.0),
        //       child: FloatingActionButton(
        //         child: const Icon(Icons.brightness_6),
        //         onPressed: () => context.read<ThemeCubit>().toggleTheme(),
        //       ),
        //     ),
        //   ],
        // ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFFf5851f),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.do_disturb),
              label: 'Cart',
            ),
          ],
          onTap: (value) {
            _navigationQueue.addLast(index);
            setState(() => index = value);
            // print(value);
          },
        ),
      ),
    );
  }

  Widget getBody(int index) {
    switch (index) {
      case 0:
        return const MyHomePage();
      case 1:
        return const Account();
      case 2:
        return const Cart();
      case 3:
        return const Profile();
      default:
        return const MyHomePage();
    }
  }
}
