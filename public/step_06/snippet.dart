import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  // TODO choose right navigator key:
  // navigatorKey: ,
  routes: [
    // TODO add ShellRoute with two routes, each of them having one child route:
    //   / -> /details/:id  (MainScreen -> DetailsScreen)
    //  /profile -> /profile/details/:id  (ProfileScreen -> DetailsScreen)
  ],
);

class ScaffoldWithBottomBar extends StatefulWidget {
  const ScaffoldWithBottomBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _ScaffoldWithBottomBarState();
  }
}

class _ScaffoldWithBottomBarState extends State<ScaffoldWithBottomBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        onTap: _changeTab,
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  void _changeTab(int value) {
    switch (value) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/profile');
        break;
    }
    setState(() {
      _index = value;
    });
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: () {
            context.go('/profile/details/2');
          },
          child: const Text('Go to details of element 2'),
        ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.go('/details/1');
        },
        child: const Text(
          "Go to details of element 1",
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.id, this.additionalInfo});

  final String id;
  final String? additionalInfo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ID: $id'),
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: const Text('Go back'),
          ),
        ],
      ),
    );
  }
}
