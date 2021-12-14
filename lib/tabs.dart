import 'package:flutter/material.dart';

Widget tabBars() {
  return Flexible(
    child: DefaultTabController(
        length: 2,
        child: TabBar(
          tabs: const [
            Text("Today's Matches"),
            Text("Tomorrow Matches"),
          ],
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurpleAccent,
          ),
        )),
  );
}

// Widget tabBarView(Map mapresponse, List listresponse, Color cardcolor) {
//   return TabBarView(children: [
//     mapresponse == null
//         ? const Padding(
//             padding: EdgeInsets.only(top: 30),
//             child: Center(
//               child: CircularProgressIndicator(
//                 color: Colors.deepPurpleAccent,
//               ),
//             ),
//           )
//         : team_detail(listresponse, cardcolor),
//   ]);
// }
