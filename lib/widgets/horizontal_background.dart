import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transparent_image/transparent_image.dart';

import '../screens/background_details.dart';
import '../models/image_models.dart';

class HorizontalBackground extends StatefulWidget {
  const HorizontalBackground(
      {super.key, required this.data, required this.isLandscape});

  final List<Background> data;
  final bool isLandscape;

  @override
  State<HorizontalBackground> createState() => _HorizontalBackgroundState();
}

class _HorizontalBackgroundState extends State<HorizontalBackground> {
  var activeIndex = 0;

  void selectBackground(BuildContext context, Background dummyData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BackgroundDetailsScreen(data: dummyData),
      ),
    );
  }

  Widget portraitView() {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.data.length - (widget.data.length - 5),
          itemBuilder: (context, index, realIndex) {
            return Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  selectBackground(context, widget.data[index]);
                },
                child: Stack(
                  children: [
                    Hero(
                      tag: widget.data[index].id,
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(widget.data[index].imageUrl),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.data[index].name,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.23,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() => activeIndex = index);
            },
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.data.length - (widget.data.length - 5),
              effect: SlideEffect(
                  activeDotColor: Colors.white,
                  dotWidth: MediaQuery.of(context).size.width * 0.02,
                  dotHeight: MediaQuery.of(context).size.width * 0.02),
            ),
          ),
        )
      ],
    );
  }

  Widget landscapeView() {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.data.length - (widget.data.length - 5),
          itemBuilder: (context, index, realIndex) {
            return Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  selectBackground(context, widget.data[index]);
                },
                child: Stack(
                  children: [
                    Hero(
                      tag: widget.data[index].id, // change with unique id
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(widget.data[index].imageUrl),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.5,
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.data[index].name,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.5,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() => activeIndex = index);
            },
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.data.length - (widget.data.length - 5),
              effect: SlideEffect(
                  activeDotColor: Colors.white,
                  dotWidth: MediaQuery.of(context).size.height * 0.02,
                  dotHeight: MediaQuery.of(context).size.height * 0.02),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLandscape) {
      return landscapeView();
    } else {
      return portraitView();
    }
  }
}
