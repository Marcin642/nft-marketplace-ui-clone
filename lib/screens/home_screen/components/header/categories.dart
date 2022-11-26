import 'package:flutter/material.dart';
import 'package:nft_marketplace_dribble_clone/utils/constants.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

dynamic categoriesList = [
  // [categorieName, isActive]
  ['All', true],
  ['Trendy', false],
  ['Popular', false],
  ['Featured', false],
  ['New', false],
];

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        height: 30,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                // set all categories isActive to false
                for (var categories in categoriesList) {
                  categories[1] = false;
                }
                // set isActive  of selected category to true
                categoriesList[index][1] = !categoriesList[index][1];
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:
                    categoriesList[index][1] ? kPrimaryColor : kBackgroundColor,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: Text(
                  categoriesList[index][0],
                  style: TextStyle(
                    color: categoriesList[index][1]
                        ? kBackgroundColor
                        : kPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
