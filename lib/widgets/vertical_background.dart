import 'package:background_picker/widgets/container_vertical.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../screens/background_details.dart';
import '../models/image_models.dart';

class VerticalBackground extends StatelessWidget {
  const VerticalBackground(
      {super.key,
      required this.data,
      required this.isLandscape,
      required this.isFromFavorite});

  final List<Background> data;
  final bool isLandscape;
  final bool isFromFavorite;

  void selectBackground(BuildContext context, Background dummyData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BackgroundDetailsScreen(data: dummyData),
      ),
    );
  }

  Widget portraitView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: isFromFavorite ? data.length : data.length - 5,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                selectBackground(
                    context, isFromFavorite ? data[index] : data[index + 5]);
              },
              child: Stack(
                children: [
                  Hero(
                    tag: isFromFavorite ? data[index].id : data[index + 5].id,
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(isFromFavorite
                          ? data[index].imageUrl
                          : data[index + 5].imageUrl),
                      fit: BoxFit.cover,
                      height: 300,
                      width: 200,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ContainerVertical(
                      data: isFromFavorite ? data[index] : data[index + 5],
                      isLandscape: false,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget landscapeView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: isFromFavorite ? data.length : data.length - 5,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                selectBackground(
                    context, isFromFavorite ? data[index] : data[index + 5]);
              },
              child: Stack(
                children: [
                  Hero(
                    tag: isFromFavorite ? data[index].id : data[index + 5].id,
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(isFromFavorite
                          ? data[index].imageUrl
                          : data[index + 5].imageUrl),
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.height,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ContainerVertical(
                      data: isFromFavorite ? data[index] : data[index + 5],
                      isLandscape: true,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget emptyView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          'No wallpapers was added to favorite!',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return emptyView(context);
    } else if (isLandscape) {
      return landscapeView();
    } else {
      return portraitView();
    }
  }
}
