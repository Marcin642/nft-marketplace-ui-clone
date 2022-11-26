import 'package:flutter/material.dart';
import 'package:nft_marketplace_dribble_clone/utils/constants.dart';

import './screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Marketplace Dribble Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: kPrimaryTextColor,
              fontFamily: 'OpenSans',
            ),
        iconTheme: const IconThemeData(color: kPrimaryTextColor),
      ),
      home: const HomeScreen(),
    );
  }
}
