import 'package:flutter/material.dart';
import 'package:nft_marketplace_dribble_clone/utils/constants.dart';

class TopPanel extends StatefulWidget {
  const TopPanel({super.key});

  @override
  State<TopPanel> createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
        // print(containerWidth);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              width: isExpanded ? 108 : 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kPrimaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: const [
                    Icon(
                      Icons.wallet,
                      color: kBackgroundColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '4.798 ETH',
                      style: TextStyle(
                        color: kBackgroundColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
                  Icons.notifications_none,
                  color: kPrimaryTextColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              height: 36,
              width: 36,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/images/avatar.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
