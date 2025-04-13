import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:medical_app/core/app/main_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: dotenv.env["SUPABASE_URL"] ?? '',
      anonKey: dotenv.env["SUPABASE_ANON_KEY"] ?? '');
  runApp(const MainApp());
}
