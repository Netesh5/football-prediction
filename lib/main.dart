import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:footballprediction/teams_detail.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "RobotoMono",
      ),
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map? mapresponse;
  Map? mapresponse2;
  Map? mapresponse3;
  List? listresponse;
  String? stringresponse;

  Future fetchdata() async {
    http.Response response;
    response = await http.get(
        Uri.parse("https://football-prediction1.p.rapidapi.com/today"),
        headers: {
          'x-rapidapi-host': 'football-prediction1.p.rapidapi.com',
          'x-rapidapi-key': 'd83ac41cb1msh02d38254c7d5f4cp18e066jsne1c62a888b55'
        });
    if (response.statusCode == 200) {
      setState(() {
        mapresponse = json.decode(response.body);
        listresponse = mapresponse!["matches"];
      });
    }
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  Color bgcolor = const Color(0xff050810);
  Color cardcolor = const Color(0xff171D2D);
  Color textcolor = const Color(0xff838489);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: bgcolor,
        iconTheme: IconThemeData(color: cardcolor),
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xff050810),
        child: ListView(children: const []),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Hi, Nitesh Paudel ",
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
            // Padding(
            //   padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            //   child: Card(

            //     color: cardcolor,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)),
            //     child: const TextField(
            //       cursorHeight: 30.0,
            //     ),
            //   ),
            // ),
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
                          hintStyle: TextStyle(color: Colors.deepPurple[50])),
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
                  )
                ],
              ),
            ),
            mapresponse == null
                ? const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  )
                : team_detail(listresponse!, cardcolor),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgcolor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: bgcolor,
            icon: const Icon(
              Icons.home_filled,
              color: Colors.deepPurple,
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.compass_calibration,
              color: Colors.deepPurple,
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_indoor_rounded,
              color: Colors.deepPurple,
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.deepPurple,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
