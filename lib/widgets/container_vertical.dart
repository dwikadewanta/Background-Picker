import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/image_models.dart';
import '../providers/favorites_provider.dart';

class ContainerVertical extends ConsumerWidget {
  const ContainerVertical(
      {super.key, required this.data, required this.isLandscape});

  final Background data;
  final bool isLandscape;

  Widget portraitView(BuildContext context, WidgetRef ref, bool isFavorite) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
        horizontal: MediaQuery.of(context).size.width * 0.015,
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.015,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.033,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                data.creator,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.025,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
              size: MediaQuery.of(context).size.width * 0.075,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
        ],
      ),
    );
  }

  Widget landscapeView(BuildContext context, WidgetRef ref, bool isFavorite) {
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.05,
        horizontal: 6,
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.008,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.022,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                data.creator,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.015,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
                  backgroundColor: const Color.fromARGB(255, 28, 24, 46),
                  content: Text(
                    wasAdded
                        ? 'Background added as a favorite'
                        : 'Background removed as a favorite',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                size: MediaQuery.of(context).size.width * 0.04,
                color: Colors.white),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
        ],
      ),
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
