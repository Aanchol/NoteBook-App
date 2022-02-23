import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notebook_app/utils/app_name.dart';
import 'package:notebook_app/utils/draweritem_widget.dart';



class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:double.infinity,
      width: 300,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top:80.0,left:28),
                child: AppName(),
              ),
              SizedBox(
                height:100,
              ),
              DrawerItemWidget(
                drawerText: "About Us".toUpperCase(),
                drawerIcon: FontAwesomeIcons.info,
                onPressed: (){

                },
              ),
              SizedBox(
                height:30,
              ),
              DrawerItemWidget(
                drawerText: "Delete Account".toUpperCase(),
                drawerIcon: FontAwesomeIcons.cross,
                onPressed: (){

                },
              ),
              SizedBox(
                height:30,
              ),
              DrawerItemWidget(
                drawerText: "Log Out".toUpperCase(),
                drawerIcon: FontAwesomeIcons.backward,
                onPressed: (){

                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}


