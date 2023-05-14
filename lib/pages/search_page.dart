
import 'package:flutter/material.dart';
import 'package:marvel_comics/widgets/comics_card.dart';


class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
//search page for searching comics by title(remember to type hero name correctly: spider-man not spiderman, ant-man etc.)
//shows results as comics slider
class _SearchScreenState extends State<SearchScreen> {
  final searchTextController = TextEditingController();

  //by default it displays Deadpool comics but you can search for different ones
  String searchText = "Deadpool";
  String heroName = "Deadpool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchTextController,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    icon: const Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    hintText: "Search for comic book by title",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  onSubmitted: (value) {
                    if(searchTextController.text.isEmpty){
                      value = " ";
                    }
                    setState(() {
                      searchText = value;
                      searchTextController.clear();
                      heroName = searchText;
                      FocusManager.instance.primaryFocus?.unfocus();
                    });
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    if(searchTextController.text.isEmpty){
                      searchText = " ";
                    }
                    searchTextController.clear();
                    heroName = searchText;
                    FocusManager.instance.primaryFocus?.unfocus();
                  });
                },
                child: Icon(Icons.search, color: Colors.red, size: 30),
              ),
            ],
          ),
          Expanded(child: buildSlider(context, heroName))
        ],
      ),
    );
  }
}
