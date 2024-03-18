// import 'package:demo2/Dats_Entry.dart';
// import 'package:demo2/User_list.dart';
// import 'package:demo2/form_demo_login_validation_regex.dart';
// import 'package:demo2/shared.dart';
// import 'package:demo2/tab1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDemo extends StatefulWidget {
  @override
  _NavDemoState createState() => _NavDemoState();
}

class _NavDemoState extends State<NavDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("NavigationDrawer")),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
              child: Image.network(
                  "https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D"),
            )),
            ListTile(title: Text("Home"),trailing: Icon(Icons.home),),
            ListTile(title: Text("balance"),trailing: Icon(Icons.account_balance_outlined),),
            ListTile(title: Text("power"),trailing: Icon(Icons.offline_bolt),),
            ListTile(title: Text("Contect"),trailing: Icon(Icons.call),),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.white70,
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) {
      //           return DataEntry(null);
      //           // return EnterDetail(Detail: null,);
      //         },
      //       ),
      //     );
      //   },
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Center(
                child: Text(
                  snapshot.data!.getString('ScreenName').toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                ),
              );
            } else {
              return Text('No Data Found');
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
