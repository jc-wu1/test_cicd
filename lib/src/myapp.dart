import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cicd/src/account.dart';
import 'package:test_cicd/src/cart.dart';
import 'package:test_cicd/src/myhomepage.dart';
import 'package:test_cicd/src/profile.dart';
import 'package:test_cicd/src/search.dart';
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
              child: const MenuPage(),
            ),
            initialRoute: RoutesName.home,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
        body: (getBody(index)),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
          onTap: (value) {
            _navigationQueue.addLast(index);
            setState(() => index = value);
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
      case 4:
        return const SearchPage();
      default:
        return const MyHomePage();
    }
  }
}
