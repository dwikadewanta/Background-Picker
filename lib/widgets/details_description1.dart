import 'package:background_picker/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/image_models.dart';

class DetailsDescription1 extends ConsumerWidget {
  const DetailsDescription1(
      {super.key, required this.data, required this.isLandscape});

  final Background data;
  final bool isLandscape;

  Widget portraitView(BuildContext context, WidgetRef ref, bool isFavorite) {
    return Row(
      children: [
        Icon(
          Icons.image,
          color: Color(int.parse(data.colorTheme)),
          size: MediaQuery.of(context).size.width * 0.12,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  data.creator,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteBackgroundProvider.notifier)
                  .toggleFavoriteStatus(data);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: const Color.fromARGB(255, 20, 19, 24),
                  content: Text(
                    wasAdded
                        ? 'Background added as a favorite'
                        : 'Background removed as a favorite',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.08,
            )),
      ],
    );
  }

  Widget landscapeView(BuildContext context, WidgetRef ref, bool isFavorite) {
    return Row(
      children: [
        Icon(
          Icons.image,
          color: Color(int.parse(data.colorTheme)),
          size: MediaQuery.of(context).size.width * 0.055,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.015,
        ),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  data.creator,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.015,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteBackgroundProvider.notifier)
                  .toggleFavoriteStatus(data);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: const Color.fromARGB(255, 20, 19, 24),
                  content: Text(
                    wasAdded
                        ? 'Background added as a favorite'
                        : 'Background removed as a favorite',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.032,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteBackgrounds = ref.watch(favoriteBackgroundProvider);
    final isFavorite = favoriteBackgrounds.contains(data);

    if (isLandscape) {
      return landscapeView(context, ref, isFavorite);
    } else {
      return portraitView(context, ref, isFavorite);
    }
  }
}
