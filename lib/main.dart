import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tcc_flutter_app/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env'); 
  await Supabase.initialize(
    url: 'https://rzazgvdscmzgphkuzhcc.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6YXpndmRzY216Z3Boa3V6aGNjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTkyNzk1NDEsImV4cCI6MjA3NDg1NTU0MX0.EySDIyU22SF4xO5Hu7R36t-e-2FoQhR2aPe42msPNZk');
  runApp(const App());
}

final supabase = Supabase.instance.client;