import 'package:flutter/material.dart';

class topbaritems extends StatelessWidget {
  //const topbaritems({Key? key}) : super(key: key);
  Color bgcolor = const Color(0xff050810);
  Color cardcolor = const Color(0xff171D2D);
  Color textcolor = const Color(0xff838489);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Hi, Nitesh Paudel",
                    style: TextStyle(
                        color: textcolor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Let's Predict Football",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardcolor,
                    ),
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextField(
                      style: const TextStyle(color: Colors.deepPurpleAccent),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusColor: bgcolor,
                          hintText: "Club name",
                          hoverColor: bgcolor,
                          icon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                            color: Colors.deepPurpleAccent,
                          ),
                          hintStyle: const TextStyle(color: Colors.white24)),
                      cursorColor: Colors.deepPurpleAccent,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 43,
                    decoration: (BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardcolor,
                    )),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_alt_rounded),
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}