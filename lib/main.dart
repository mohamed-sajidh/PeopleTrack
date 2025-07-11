import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:peopletrack/app/app.dart';
import 'package:peopletrack/core/utils/providers.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}
