import 'package:flutter/material.dart';
import 'package:my_app2/feature/home/presentation/screens/search/widget/last_search.dart';
import 'package:my_app2/feature/home/presentation/widgets/popular_search.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Last Search",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Clear All",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: [
                LastSearch(),
                LastSearch(),
                LastSearch(),
                LastSearch(),
              ],
            ),
            Text(
              "Popular Search",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            PopularSearch(),
            PopularSearch(),
            PopularSearch(),
            PopularSearch(),
          ],
        ),
      ),
    );
  }
}
