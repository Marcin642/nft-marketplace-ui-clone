import 'package:flutter/material.dart';
import 'package:nft_marketplace_dribble_clone/models/nft.dart';
import 'package:nft_marketplace_dribble_clone/screens/details_screen/details_screen.dart';
import 'package:nft_marketplace_dribble_clone/utils/constants.dart';

class ScrollableNftItem extends StatelessWidget {
  const ScrollableNftItem({
    super.key,
    required this.singleNftItem,
  });

  final Nft singleNftItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(currentNftItem: singleNftItem),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 100,
          width: 300,
          color: Colors.blue,
          child: Stack(
            children: [
              Image.asset(
                singleNftItem.imagePath,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 150,
                  color: kSecondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Text(
                          singleNftItem.artistName,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          singleNftItem.artistNick,
                          style: const TextStyle(
                              fontSize: 14, color: kSecondaryTextColor),
                        ),
                        const SizedBox(height: 15),
                        statisticsRow(singleNftItem),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                // middle avatar
                bottom: 125,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
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
                        singleNftItem.artistAvatarPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget customVerticalDivider() {
  return const SizedBox(
    height: 40,
    child: VerticalDivider(
      width: 2,
      color: kPrimaryTextColor,
    ),
  );
}

Widget statisticsRow(Nft nft) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Text('${nft.totalItem}k'),
          const Text(
            'Total Item',
            style: TextStyle(fontSize: 14, color: kSecondaryTextColor),
          ),
        ],
      ),
      customVerticalDivider(),
      Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/ethereum.png',
                height: 20,
              ),
              Text('${nft.floorPrice}'),
            ],
          ),
          const Text(
            'Floor price',
            style: TextStyle(fontSize: 14, color: kSecondaryTextColor),
          ),
        ],
      ),
      customVerticalDivider(),
      Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/ethereum.png',
                height: 20,
              ),
              Text('${nft.volumeTrade}k'),
            ],
          ),
          const Text(
            'Volume Trade',
            style: TextStyle(fontSize: 14, color: kSecondaryTextColor),
          ),
        ],
      ),
    ],
  );
}
