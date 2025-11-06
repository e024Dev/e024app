import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final darkModeProvider = StateProvider<bool>((ref) => false);
final supabaseProvider = Provider<SupabaseClient>((ref) => Supabase.instance.client);
