import 'package:colorfilter_generator/presets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List myColors = <Color>[
  Colors.redAccent,
  Colors.greenAccent,
  Colors.lightBlueAccent,
  Colors.pinkAccent,
  Colors.orangeAccent,
  Colors.purpleAccent,
  Colors.indigoAccent,
  Colors.grey,
];

Color primaryColor = myColors[0];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black, Colors.grey])),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Flutter Color Changer",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    children: [
                      buildImage(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [buildIconColor()],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                primaryColor,
                BlendMode.hue,
              ),
              child: Container(
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  "assets/shirt.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      );

  Widget buildIconColor() => Positioned(
        child: Row(
          children: [for (var i = 0; i < 8; i++) buildIconBtn(myColors[i])],
        ),
      );

  Widget buildIconBtn(Color myColor) => Stack(
        children: [
          Positioned(
              child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Icon(
              Icons.check,
              size: 70,
              color: primaryColor == myColor ? myColor : Colors.transparent,
            ),
          )),
          IconButton(
            onPressed: () {
              setState(() {
                primaryColor = myColor;
              });
            },
            icon: const Icon(Icons.circle),
            color: myColor.withOpacity(0.80),
            iconSize: 80,
          ),
        ],
      );
}
