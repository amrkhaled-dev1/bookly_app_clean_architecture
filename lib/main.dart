import 'package:bookly_app_clean_architecture/core/router/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoute.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
