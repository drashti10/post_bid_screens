import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        SearchScreen.routeName: (context) => const SearchScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        PostScreen.routeName: (context)  =>  PostScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        
        
      },
    );
  }
}
