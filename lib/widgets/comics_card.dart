import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marvel_comics/widgets/details_page.dart';
import 'package:provider/provider.dart';
import 'package:marvel_comics/models/post_api_service.dart';

//Future builder widget for building carousel slider with comics

FutureBuilder<Response> buildSlider(BuildContext context, String title) {
  return FutureBuilder<Response>(
    future: Provider.of<PostApiService>(context, listen: true).getComics(title),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        //if there is no internet connection
        if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Check your internet connection",
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
            ),
          );
        }
        //returns list from decoded jason
        final dynamic comicsData = json.decode(snapshot.data!.bodyString);
        final List comics = comicsData["data"]["results"];
        if (comics.isEmpty) {
          //returns no results text if data is empty
          return const Center(
            child: Text(
              "No search results",
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
            ),
          );
        }
        return CarouselSlider.builder(
          itemCount: comics.length,
          itemBuilder: (context, index, realIndex) {
            // i know, this part gets messy but it will be improved
            //it assignes values from list from json and passes them to build image constructor
            final title = comics[index]["title"] ?? "No title";
            final description =
                comics[index]["description"] ?? "No description available";
            final writer = comics[index]["creators"]["items"] ?? "Stan Lee";
            final website = comics[index]["urls"] ?? "https://www.marvel.com/";
            final image =
                Image.network(comics[index]["thumbnail"]["path"] + ".jpg");
            //returning carousele content with buildImage
            //buildImage widget is below
            return buildImage(
                image, title, index, description, website, writer, context);
          },
          options: CarouselOptions(
            height: 500,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            viewportFraction: 0.7,
          ),
        );
      } else {
        // Show a loading indicator while waiting for the posts
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      }
    },
  );
}

// separated buildImage widget
//it build carousele content
//takes a lot of values, i need to improve that part
//works kinda good tho
Widget buildImage(Image image, String title, int index, String description,
    List website, List writer, context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    color: Colors.grey,
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                detailsPage(image, title, description, website, writer)));
      },
      child: Stack(
        children: [
          Image(
            image: image.image,
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              // fancy container with gradient to display comics title
              alignment: Alignment.bottomLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(50, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
