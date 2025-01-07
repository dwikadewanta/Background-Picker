import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

class SupabaseServices {
  Future<PostgrestList> fetchData() async {
    final supabase = Supabase.instance.client;

    final data = await supabase.from('backgrounds_table').select();
    return data;
  }

  Future<String> saveImage(String url, String filename) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final pictureDir = Directory('/storage/emulated/0/Download');
        if (!await pictureDir.exists()) {
          await pictureDir.create(recursive: true);
        }

        final filePath = '${pictureDir.path}/$filename.jpg';
        final file = File(filePath);

        await file.writeAsBytes(response.bodyBytes);
        return filePath;
      } else {
        throw Exception('Failed to download image : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error saving image: $e');
    }
  }

  Future<void> updateDownloadCount(int currentDownloads, int id) async {
    final supabase = Supabase.instance.client;

    final response = await supabase
        .from('backgrounds_table')
        .update({'downloads': currentDownloads + 1}).eq('id', id);

    if (response.error != null) {
      print('Update failed: ${response.error!.message}');
    } else {
      print('Update succeeded: ${response.data}');
    }
  }
}
