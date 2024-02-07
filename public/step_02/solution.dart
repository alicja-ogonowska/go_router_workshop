import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) => const DetailsScreen(),
        ),
      ],
    ),
  ],
);


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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            context.go('/details');
          },
          child: const Text(
            "Go to details",
          ),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Text(
                "Go back",
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go('/holidays');
              },
              child: const Text(
                "Go who knows where...",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
