import 'package:flutter/material.dart';

import 'package:nft_marketplace_dribble_clone/screens/home_screen/components/header/header.dart';
import 'package:nft_marketplace_dribble_clone/screens/home_screen/components/scrollable_NFTs/scrollable_nft_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          // headaer
          Header(),
          SizedBox(height: 16),
          // highlighted nft pages [scrollable]
          ScrollableNftList(),
        ],
      ),
    );
  }
}
