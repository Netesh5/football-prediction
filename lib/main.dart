import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:footballprediction/drawer.dart';
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
          iconTheme: const IconThemeData(color: Colors.white),
          fontFamily: "RobotoMono",
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: Color(0xff838489), fontSize: 16))),
      home: const Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  Map? mapresponse;
  Map? mapresponse2;
  Map? mapresponse3;
  List? listresponse;
  List? listresponse2;
  int _currentindex = 0;
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;

  TextEditingController textEditingController = TextEditingController();

  Future fetchdata() async {
    http.Response response;
    response = await http.get(
        Uri.parse("https://football-prediction1.p.rapidapi.com/today"),
        headers: {
          'x-rapidapi-host': 'football-prediction1.p.rapidapi.com',
          'x-rapidapi-key': 'd83ac41cb1msh02d38254c7d5f4cp18e066jsne1c62a888b55'
        });
    try {
      if (response.statusCode == 200) {
        setState(() {
          mapresponse = json.decode(response.body);
          listresponse = mapresponse!["matches"];
          listresponse2 = listresponse!;
        });
      }
    } on Exception catch (e) {
      Center(
          child: Text(
        e.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 30),
      ));
    }
  }

  // ignore: non_constant_identifier_names
  teamdetail Teamdetail = teamdetail();
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  Color bgcolor = const Color(0xff050810);
  Color cardcolor = const Color(0xff171D2D);
  Color textcolor = const Color(0xff838489);

  void onItemTapped(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  filter(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                    color: cardcolor, borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Filter by League",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const Divider(
                      height: 30,
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Checkbox(
                              activeColor: Colors.deepPurpleAccent,
                              checkColor: Colors.white,
                              value: checkbox1,
                              onChanged: (value) {
                                setState(() {
                                  checkbox1 = value!;
                                });
                              }),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            "UEFA",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Checkbox(
                              hoverColor: Colors.deepPurpleAccent,
                              checkColor: Colors.white,
                              value: checkbox2,
                              onChanged: (bool? value) {
                                setState(() {
                                  checkbox2 = value!;
                                });
                              }),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            "UEFA",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Checkbox(
                              hoverColor: Colors.deepPurpleAccent,
                              checkColor: Colors.white,
                              value: checkbox3,
                              onChanged: (bool? value) {
                                setState(() {
                                  checkbox3 = value!;
                                });
                              }),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            "UEFA",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Checkbox(
                              hoverColor: Colors.deepPurpleAccent,
                              checkColor: Colors.white,
                              value: checkbox4,
                              onChanged: (bool? value) {
                                setState(() {
                                  checkbox4 = value!;
                                });
                              }),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            "UEFA",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(15)),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              checkbox1 = false;
                              checkbox2 = false;
                              checkbox3 = false;
                              checkbox4 = false;
                            });
                          },
                          child: const Text("Clear",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white))),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      // appBar: AppBar(
      //   backgroundColor: bgcolor,
      //   iconTheme: IconThemeData(color: cardcolor),
      //   elevation: 0,
      // ),
      drawer: draweritem(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (_, __) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 212,
                backgroundColor: bgcolor,
                pinned: true,
                floating: true,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: SingleChildScrollView(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: TextField(
                                    controller: textEditingController,
                                    onChanged: (value) {
                                      //print(widget.Listresponse![0]["awayTeam"]);
                                      setState(() {
                                        listresponse2 = listresponse!
                                            .where((element) =>
                                                (element["homeTeam"]
                                                    .toString()
                                                    .toLowerCase()
                                                    .contains(
                                                        value.toLowerCase())) ||
                                                (element["awayTeam"]
                                                    .toString()
                                                    .toLowerCase()
                                                    .contains(
                                                        value.toLowerCase())))
                                            .toList();
                                      });
                                    },
                                    style: const TextStyle(
                                        color: Colors.deepPurpleAccent),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        focusColor: bgcolor,
                                        hintText: "Club name",
                                        hoverColor: bgcolor,
                                        icon: IconButton(
                                          onPressed: () {
                                            //result=_Teamdetail
                                          },
                                          icon: const Icon(Icons.search),
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        hintStyle: const TextStyle(
                                            color: Colors.white24)),
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
                                    onPressed: () {
                                      filter(context);
                                    },
                                    icon: const Icon(Icons.filter_alt_rounded),
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(
                  tabs: const [
                    SizedBox(
                        height: 25,
                        child: Center(child: Text("Today's Matches"))),
                    SizedBox(
                        height: 25,
                        child: Center(child: Text("Tomorrow Matches"))),
                  ],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurpleAccent,
                  ),
                  indicatorPadding: const EdgeInsets.only(left: 10, right: 10),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              mapresponse == null
                  ? const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    )
                  : Teamdetail.team_detail(listresponse2!, cardcolor),
              mapresponse == null
                  ? const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                    )
                  : Teamdetail.team_detail(listresponse2!, cardcolor),
            ],
          ),
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
            backgroundColor: Colors.teal,
            icon: Icon(
              Icons.compass_calibration,
              color: Colors.deepPurple,
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            backgroundColor: Colors.deepOrangeAccent,
            icon: Icon(
              Icons.camera_indoor_rounded,
              color: Colors.deepPurple,
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(
              Icons.person,
              color: Colors.deepPurple,
            ),
            label: "",
          ),
        ],
        selectedItemColor: cardcolor,
        currentIndex: _currentindex,
        onTap: onItemTapped,
      ),
    );
  }
}
