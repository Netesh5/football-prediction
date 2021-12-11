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
        Uri.parse("https://football-prediction1.p.rapidapi.com/best-bets"),
        headers: {
          'x-rapidapi-host': 'football-prediction1.p.rapidapi.com',
          'x-rapidapi-key': 'd83ac41cb1msh02d38254c7d5f4cp18e066jsne1c62a888b55'
        });
    if (response.statusCode == 200) {
      setState(() {
        mapresponse = json.decode(response.body);

        listresponse = mapresponse!["matches"]["today"];
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        title: const Text(
          "Football Prediction",
          style: TextStyle(fontFamily: "RobotoMono"),
        ),
        centerTitle: true,
        backgroundColor: cardcolor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mapresponse == null
                ? const Padding(
                    padding: EdgeInsets.only(top: 20),
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
    );
  }
}
