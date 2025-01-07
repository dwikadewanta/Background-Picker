import 'package:background_picker/models/image_models.dart';
import 'package:flutter/cupertino.dart';

class BackgroundData {
  BackgroundData({required this.snapshotData});

  final AsyncSnapshot<List<Map<String, dynamic>>> snapshotData;

  List<Background> processData() {
    List<Background> backgroundData = [];

    if (snapshotData.hasData && snapshotData.data != null) {
      for (var item in snapshotData.data!) {
        final background = Background(
            id: item['id'],
            name: item['name'],
            creator: item['creator'],
            description: item['description'],
            colorTheme: item['color_theme'],
            subColor: item['sub_color_theme'],
            downloads: item['downloads'],
            category: item['category'],
            size: item['size'],
            sizeImage: item['size_image'],
            imageUrl: item['image_url']);
        backgroundData.add(background);
      }
    }
    final reversedBackground = backgroundData.reversed.toList();
    return reversedBackground;
  }
}
