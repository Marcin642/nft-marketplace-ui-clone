import 'package:flutter/material.dart';
import 'package:nft_marketplace_dribble_clone/models/nft.dart';
import 'package:nft_marketplace_dribble_clone/utils/constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.currentNftItem,
  });

  final Nft currentNftItem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // it will be possible to place elements behind navBar (in this case to add shadow at the page bottom)
      extendBody: true,
      body: ListView(
        children: [
          customAppBar(context),
          SizedBox(
            height: size.height * 0.6,
            width: double.infinity,
            child: Image.asset(
              currentNftItem.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          infoWidget(currentNftItem),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              kPlaceHolderDescription,
              style: TextStyle(color: kSecondaryTextColor),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kPrimaryColor,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Text(
            'Place your BID',
            style: TextStyle(
              fontSize: 18,
              color: kBackgroundColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 30,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              kBackgroundColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

Widget customAppBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(6.0),
              child: Icon(
                Icons.arrow_back,
                color: kPrimaryTextColor,
              ),
            ),
          ),
        ),
        const Spacer(),
        const Text(
          'Place your bid',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: kSecondaryColor,
          ),
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(
              Icons.share_outlined,
              color: kPrimaryTextColor,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget infoWidget(Nft nft) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 1,
              color: kPrimaryTextColor,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              nft.artistAvatarPath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        customTextColumn(
          upperText: nft.artistName,
          bottomText: nft.artistNick,
        ),
        const Spacer(),
        customTextColumn(
          upperText: '${nft.floorPrice} ETH',
          bottomText: 'Highest Bid',
          providedCrossAxisAlignment: CrossAxisAlignment.end,
        )
      ],
    ),
  );
}

Widget customTextColumn({
  String? upperText,
  String? bottomText,
  CrossAxisAlignment? providedCrossAxisAlignment,
}) {
  return Column(
    crossAxisAlignment: providedCrossAxisAlignment ?? CrossAxisAlignment.start,
    children: [
      Text(
        upperText ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      Text(
        bottomText ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: kSecondaryTextColor,
        ),
      ),
    ],
  );
}
