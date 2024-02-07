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
          path: 'details/:id',
          builder: (context, state) {
            return DetailsScreen(
                id: state.pathParameters['id']!,
                additionalInfo: state.uri.queryParameters['additionalInfo']);
          },
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
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.go('/details/1');
              },
              child: const Text(
                "Go to details of element 1",
              ),
            ),
            GestureDetector(
              onTap: () {
                context.go(Uri(path: '/details/2', queryParameters: {
                  'additionalInfo': 'I hope you are not too tired!'
                }).toString());
              },
              child: const Text(
                "Go to details of element 2",
              ),
            ),
          ],
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: $id'),
            Text('Additional info: $additionalInfo'),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Text(
                "Go back",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
