import 'package:flutter/material.dart';

import '../models/image_models.dart';

class DetailsDescription2 extends StatelessWidget{
  const DetailsDescription2({super.key, required this.data, required this.isLandscape});

  final bool isLandscape;

  final Background data;

  Widget portraitView(BuildContext context){
    return Card(
      color: Color(int.parse(data.colorTheme)),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.download_for_offline,
                        size: MediaQuery.of(context).size.width * 0.032,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.032,
                      ),
                      Text(
                        "Downloads: ${data.downloads.toString()}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.032,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.fit_screen,
                        size: MediaQuery.of(context).size.width * 0.032,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.032,
                      ),
                      Text(
                        data.size,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.032,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.032,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.emoji_objects,
                        size: MediaQuery.of(context).size.width * 0.032,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.032,
                      ),
                      Text(
                        data.category,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.032,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.folder,
                        size: MediaQuery.of(context).size.width * 0.032,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.032,
                      ),
                      Text(
                        "${data.sizeImage.toString()} MB",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.032,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget landscapeView(BuildContext context){
    return Card(
      color: Color(int.parse(data.colorTheme)),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.download_for_offline,
                        size: MediaQuery.of(context).size.width * 0.013,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.013,
                      ),
                      Text(
                        "Downloads: ${data.downloads.toString()}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.013,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.fit_screen,
                        size: MediaQuery.of(context).size.width * 0.013,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.013,
                      ),
                      Text(
                        data.size,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.013,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.013,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.emoji_objects,
                        size: MediaQuery.of(context).size.width * 0.013,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.013,
                      ),
                      Text(
                        data.category,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.013,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.folder,
                        size: MediaQuery.of(context).size.width * 0.013,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.013,
                      ),
                      Text(
                        "${data.sizeImage.toString()} MB",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.013,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(isLandscape){
      return landscapeView(context);
    }else{
      return portraitView(context);
    }
  }
}