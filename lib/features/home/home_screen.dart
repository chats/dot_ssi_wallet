import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import '../../data/announcement_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Credential Wallet"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            //searchBar(context),
            annoucement(context),
            SizedBox(height: 20),
            prefersCards(context),
          ],
        )));
  }

  Widget searchBar(BuildContext context) {
    final homeController = Get.put(HomeController());
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  homeController.setSearchActive(true);
                } else {
                  homeController.setSearchActive(false);
                }
                print('searchActive: ${homeController.searchActive}');
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: colorScheme.surfaceVariant,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //isDense: true,
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        GetX<HomeController>(
          builder: (controller) {
            return Visibility(
              visible: controller.searchActive,
              child: TextButton(
                onPressed: () {
                  controller.setSearchActive(false);
                  print('searchActive: ${controller.searchActive}');
                },
                child: Text("Cancel"),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget annoucement(BuildContext context) {
    const fgColor = Colors.white;
    const colors = [
      Colors.blue,
      Colors.green,
      Colors.purple,
    ];
    final textTheme = Theme.of(context).textTheme;
    int idx = 0;
    return CarouselSlider(
      options: CarouselOptions(
          height: 150.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10)),
      //items: [1, 2, 3, 4, 5].map((i) {
      items: announcements.map((i) {
        return Builder(
          builder: (BuildContext context) {
            final color = colors[idx % colors.length];
            idx++;
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: color,
                  //image: DecorationImage(
                  //  image: NetworkImage(i.imageUrl!),
                  //  fit: BoxFit.cover,
                  //),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${i.title}',
                        style: TextStyle(
                            fontSize: textTheme.titleMedium!.fontSize,
                            color: fgColor),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${i.description}',
                        style: TextStyle(
                            fontSize: textTheme.bodySmall!.fontSize,
                            color: fgColor),
                      ),
                    ],
                  ),
                ));
          },
        );
      }).toList(),
    );
  }

  Widget prefersCards(BuildContext context) {
    return Column(
      children: announcements.map((i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            child: ListTile(
              title: Text(i.title),
              subtitle: Text(i.description),
            ),
          ),
        );
      }).toList(),
    );
  }
}
