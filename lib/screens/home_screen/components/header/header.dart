import 'package:flutter/material.dart';

import 'package:nft_marketplace_dribble_clone/screens/home_screen/components/header/categories.dart';
import 'package:nft_marketplace_dribble_clone/screens/home_screen/components/header/top_panel.dart';
import 'package:nft_marketplace_dribble_clone/utils/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TopPanel(),
        const SizedBox(height: 0),
        headerText(),
        const SizedBox(height: 16),
        const Categories(),
      ],
    );
  }
}

Widget headerText() {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Discover Top\nNFT Collections',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: kPrimaryTextColor,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'The best NFT marketplace',
          style: TextStyle(
            color: kSecondaryTextColor,
          ),
        ),
      ],
    ),
  );
}
