import 'package:flutter/material.dart';
import 'package:kreatr_app/screens/deatils_screen.dart';
import 'package:provider/provider.dart';

import 'providers/task_provider.dart';
import 'screens/home_screen.dart';

class MainApp extends StatelessWidget {
  
  var routes = {
    HomeScreen.routeName: (context) => const HomeScreen(),
    DetailsScreen.routeName: (context) => const DetailsScreen(),
  };

  var initialRoute = HomeScreen.routeName;

  @override
  Widget build(BuildContext context) {
    initialRoute = initialRoute;
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TaskProvider())],
      child: MaterialApp(
        initialRoute: initialRoute,
        routes: routes,
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}

