import 'package:background_picker/widgets/details_description1.dart';
import 'package:background_picker/widgets/details_description2.dart';
import 'package:flutter/material.dart';

import '../widgets/details_button.dart';
import '../models/image_models.dart';

class BackgroundDetailsScreen extends StatelessWidget {
  const BackgroundDetailsScreen({
    super.key,
    required this.data,
  });

  final Background data;

  Widget portraitView(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        int.parse(data.subColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0.025,
            right: MediaQuery.of(context).size.height * 0.025,
            top: MediaQuery.of(context).size.height * 0.025,
            bottom: MediaQuery.of(context).size.height * 0.06,
          ),
          child: Column(
            children: [
              Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Hero(
                  tag: data.name,
                  child: Image.network(
                    data.imageUrl,
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              DetailsDescription1(
                data: data,
                isLandscape: false,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              DetailsButton(
                isLandscape: false,
                data: data,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Spacer(),
              Text(
                data.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.032,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Spacer(),
              DetailsDescription2(
                data: data,
                isLandscape: false,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget landscapeView(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        int.parse(data.subColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.025,
            right: MediaQuery.of(context).size.width * 0.025,
            top: MediaQuery.of(context).size.width * 0.015,
            bottom: MediaQuery.of(context).size.width * 0.025,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Hero(
                    tag: data.name,
                    child: Image.network(
                      data.imageUrl,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05, //0.05
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    DetailsDescription1(
                      data: data,
                      isLandscape: true,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    DetailsButton(
                      isLandscape: true,
                      data: data,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Spacer(),
                    Text(
                      data.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.013,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Spacer(),
                    DetailsDescription2(
                      data: data,
                      isLandscape: true,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return portraitView(context);
    } else {
      return landscapeView(context);
    }
  }
}
