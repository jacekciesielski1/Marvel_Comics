import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//page for displaying comics details after tapping on comics cover
//constructed with values passed from json
class DetailsPage extends StatelessWidget {
  final Image image;
  final String title;
  final String description;
  //it passes list of websites connected with comic and later will reurn detail website if list is not empty
  final List website;
  //same as above but with writers
  final List writer;

  //constructor
  DetailsPage(
      this.image, this.title, this.description, this.website, this.writer);

  // functions for launching website in browser
  launchMarvelWebsite(Uri url) async {
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
     catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Details"),
          backgroundColor: Colors.red,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 10,
              shadowColor: Colors.blue,
              child: Image(
                image: image.image,
                height: 350,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                //some comics do not have data about writers(writers list may be empty), then it assigns Stan Lee(cool guy)
                "Written by: ${writer.isEmpty ? "Stan Lee" : writer[0]["name"]}",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: TextButton(
                child: Text(
                  "Get more info",
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {
                  //some comics may not have websites so there is a deflaut value if websites list is empty
                  final Uri _url = Uri.parse(website.isEmpty
                      ? "https://www.marvel.com/"
                      : website[0]["url"]);
                  launchMarvelWebsite(_url);
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    shadowColor: Colors.yellow,
                    elevation: 10,
                    backgroundColor: Colors.amber),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
