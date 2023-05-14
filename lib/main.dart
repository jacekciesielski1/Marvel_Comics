import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:marvel_comics/models/post_api_service.dart';

void main() {
  //lets go
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //returning provider that helps to pass Chopper resources(api service)
    return Provider(
      create: (_) => PostApiService.create(),
      dispose: (_, PostApiService service) => service.client.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //main scrren with two pages navigated by bottomnavigationbar
        home: MainScreen(),
      ),
    );
  }
}
