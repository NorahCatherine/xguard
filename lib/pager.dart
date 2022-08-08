import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/navigation_controller.dart';
import 'screens/screens.dart';

class Pager extends StatefulWidget {
  const Pager({Key? key}) : super(key: key);

  @override
  State<Pager> createState() => _PagerState();
}

class _PagerState extends State<Pager> {
  final navController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        PageView(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          controller: navController.pageController,
          children: const <Widget>[HomePage(), Request(), Profile()],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 90.0,
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: navController.navBarItems
                    .map((item) => BouncingWidget(
                          onPressed: () {
                            navController.pageSwitcher(
                                navController.navBarItems.indexOf(item));
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  item['icon'],
                                  color: Colors.white,
                                  size: 18,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  item['label'],
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              )),
        )
      ]),
    );
  }
}