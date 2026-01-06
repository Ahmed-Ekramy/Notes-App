import 'package:flutter/material.dart';
import 'notes_app.dart';
import 'package:hive/hive.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  // await Hive.initFlutter();

  // Register Hive Adapters (for custom types)??
  runApp(const MyApp());
}



