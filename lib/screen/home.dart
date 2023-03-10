import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(children: const [
                Text(
                  "Asbeza",
                  // style: ,
                ),
                Icon(Icons.person_2_outlined)
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 17),
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  // final category = categories[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 70,
                          height: 65,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(""),
                                  // image: NetworkImage(category["image"]),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: const Text('')),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(""
                            // category["name"],
                            // style: const TextStyle(fontSize: 15),
                            ),
                      )
                    ],
                  );
                }),
          )
        ],
      )),
    );
  }
}
