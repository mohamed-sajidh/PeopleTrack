import 'package:flutter/material.dart';
import 'package:peopletrack/routes/app_routes.dart';
import 'package:peopletrack/routes/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'People Track',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.login,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
