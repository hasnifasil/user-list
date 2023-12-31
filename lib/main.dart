import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/provider/uselist_provider.dart';
import 'package:user_list/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
