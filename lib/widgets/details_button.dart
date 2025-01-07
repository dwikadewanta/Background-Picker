import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager_plus/wallpaper_manager_plus.dart';
import '../models/image_models.dart';
import '../services/supabase_services.dart';

class DetailsButton extends StatefulWidget {
  const DetailsButton(
      {super.key, required this.isLandscape, required this.data});

  final bool isLandscape;
  final Background data;

  @override
  State<DetailsButton> createState() => _DetailsButtonState();
}

class _DetailsButtonState extends State<DetailsButton> {
  bool _isSaveBtnLoading = false;

  Future<void> _setWallpaper(int location, String url) async {
    final WallpaperManagerPlus wallpaperManagerPlus = WallpaperManagerPlus();
    final imageUrl = url;

    try {
      final file = await DefaultCacheManager().getSingleFile(imageUrl);
      await wallpaperManagerPlus.setWallpaper(file, location);
    } catch (e) {
      print("error setting wallpaper");
    }
  }

  Widget portraitView(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              setState(() {
                _isSaveBtnLoading = true;
              });
              try {
                await SupabaseServices()
                    .saveImage(widget.data.imageUrl, widget.data.name);
                await SupabaseServices()
                    .updateDownloadCount(widget.data.downloads, widget.data.id);
              } finally {
                // actually wrong place to put here
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 20, 19, 24),
                    content: Text('Image successfully saved',
                        style: TextStyle(color: Colors.white)),
                  ),
                );
                setState(() {
                  _isSaveBtnLoading = false;
                });
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, MediaQuery.of(context).size.height * 0.07),
            ),
            child: _isSaveBtnLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.download,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.05,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        "Save",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: Colors.white),
                      ),
                    ],
                  ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              dialogSetWallpaper(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, MediaQuery.of(context).size.height * 0.07),
              backgroundColor: Color(
                int.parse(widget.data.colorTheme),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.imagesearch_roller,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Text(
                  "Set",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget landscapeView(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              setState(() {
                _isSaveBtnLoading = true;
              });
              try {
                await SupabaseServices()
                    .saveImage(widget.data.imageUrl, widget.data.name);
                await SupabaseServices()
                    .updateDownloadCount(widget.data.downloads, widget.data.id);
              } finally {
                // actually wrong place to put here
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 20, 19, 24),
                    content: Text(
                      'Image successfully saved',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
                setState(() {
                  _isSaveBtnLoading = false;
                });
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, MediaQuery.of(context).size.height * 0.13),
            ),
            child: _isSaveBtnLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.download,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.02,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      Text(
                        "Save",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.02,
                            color: Colors.white),
                      ),
                    ],
                  ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              dialogSetWallpaper(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(0, MediaQuery.of(context).size.height * 0.13),
              backgroundColor: Color(
                int.parse(widget.data.colorTheme),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.imagesearch_roller,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Text(
                  "Set",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.02,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void dialogSetWallpaper(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Set Your Wallpaper',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _setWallpaper(
                      WallpaperManagerPlus.homeScreen, widget.data.imageUrl);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(255, 20, 19, 24),
                      content: Text(
                        'Wallpaper successfully set in home screen',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Home Screen',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  _setWallpaper(
                      WallpaperManagerPlus.lockScreen, widget.data.imageUrl);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(255, 20, 19, 24),
                      content: Text(
                        'Wallpaper successfully set in lock screen',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Lock Screen',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  _setWallpaper(
                      WallpaperManagerPlus.bothScreens, widget.data.imageUrl);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Color.fromARGB(255, 20, 19, 24),
                      content: Text(
                        'Wallpaper successfully set in home and lock screen',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_android,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Home & Lock Screen',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLandscape) {
      return landscapeView(context);
    } else {
      return portraitView(context);
    }
  }
}
