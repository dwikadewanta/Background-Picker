import 'package:background_picker/widgets/horizontal_background.dart';
import 'package:flutter/material.dart';

import '../models/image_models.dart';
import '../widgets/vertical_background.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key, required this.data});

  final List<Background> data;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                orientation == Orientation.portrait
                    ? HorizontalBackground(
                        data: data,
                        isLandscape: false,
                      )
                    : HorizontalBackground(
                        data: data,
                        isLandscape: true,
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                orientation == Orientation.portrait
                    ? VerticalBackground(
                        data: data,
                        isLandscape: false,
                        isFromFavorite: false,
                      )
                    : VerticalBackground(
                        data: data,
                        isLandscape: true,
                        isFromFavorite: false,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
