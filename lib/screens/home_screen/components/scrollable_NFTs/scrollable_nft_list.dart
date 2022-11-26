import 'package:flutter/material.dart';
import 'package:nft_marketplace_dribble_clone/models/nft.dart';
import 'package:nft_marketplace_dribble_clone/screens/home_screen/components/scrollable_NFTs/scrollable_nft_item.dart';

class ScrollableNftList extends StatefulWidget {
  const ScrollableNftList({super.key});

  @override
  State<ScrollableNftList> createState() => _ScrollableNftListState();
}

class _ScrollableNftListState extends State<ScrollableNftList> {
  PageController? controller;
  var _selectedIndex;

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: 1,
      viewportFraction: 0.9,
    );
    _selectedIndex = 1;
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var nftList = [
      Nft(
        'Mutant Ape',
        '@YugaLabs',
        'assets/images/mutant_ape_logo.png',
        'Ape 1',
        'assets/images/ape1.png',
        5.6,
        0.4,
        47.7,
      ),
      Nft(
        'Mutant Ape',
        '@YugaLabs',
        'assets/images/mutant_ape_logo.png',
        'Ape 2',
        'assets/images/ape2.png',
        5.6,
        0.4,
        47.7,
      ),
      Nft(
        'Mutant Ape',
        '@YugaLabs',
        'assets/images/mutant_ape_logo.png',
        'Ape 3',
        'assets/images/ape3.png',
        5.6,
        0.4,
        47.7,
      ),
      Nft(
        'Mutant Ape',
        '@YugaLabs',
        'assets/images/mutant_ape_logo.png',
        'Ape 4',
        'assets/images/ape4.png',
        5.6,
        0.4,
        47.7,
      ),
      Nft(
        'Mutant Ape',
        '@YugaLabs',
        'assets/images/mutant_ape_logo.png',
        'Ape 5',
        'assets/images/ape5.png',
        5.6,
        0.4,
        47.7,
      ),
      Nft(
        'Mutant Ape',
        '@YugaLabs',
        'assets/images/mutant_ape_logo.png',
        'Ape 6',
        'assets/images/ape6.png',
        5.6,
        0.4,
        47.7,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: SizedBox(
        height: 400,
        child: PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: nftList.length,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          itemBuilder: (context, index) {
            // set scale of the current item to 1.0 if its currently active, else set its scale to 0.92
            var scale = _selectedIndex == index ? 1.0 : 0.92;
            return TweenAnimationBuilder(
              duration: const Duration(milliseconds: 300),
              tween: Tween(begin: scale, end: scale),
              curve: Curves.ease,
              child: ScrollableNftItem(singleNftItem: nftList[index]),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
