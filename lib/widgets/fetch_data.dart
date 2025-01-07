import 'package:background_picker/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/data.dart';
import '../services/supabase_services.dart';

class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostgrestList>(
      future: SupabaseServices().fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          final data = BackgroundData(snapshotData: snapshot).processData();
          return BottomNavigation(
            data: data,
          );
        }
      },
    );
  }
}
