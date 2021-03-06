import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test/Router/Screens/Home.dart';

import 'Screens/About.dart';

class GetRoutNamed extends StatefulWidget {
  const GetRoutNamed({Key? key}) : super(key: key);

  @override
  State<GetRoutNamed> createState() => _GetRoutNamedState();
}

class _GetRoutNamedState extends State<GetRoutNamed> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Named Routes",
      initialRoute: "/",
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: "/", page: () => const GetRoutNamed()),
        GetPage(name: "/home", page: () => const Home()),
        GetPage(
            name: "/about",
            page: () => const About(),
            transition: Transition.leftToRight),
        GetPage(name: "/home1/:someValue", page: () => const Home())
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Navigation"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Get.toNamed("/home", arguments: "Mudassir");
                  Get.offNamed("/home1/12345");
                  // Get.offAllNamed("/home");
                  // Get.offNamed("/home");
                },
                child: const Text("Home"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/about");
                },
                child: Text("About"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
